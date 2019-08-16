using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin.Security;
using Microsoft.Owin.Security.Cookies;
using Microsoft.Owin.Security.OAuth;
using GEE.API.Controllers.Admin;
using GEE.API.Models;
using System.Web.Http;
using GEE.Business.Models;
using GEE.Business.Model.Admin;
using System.Net.Http;

namespace GEE.API.Providers
{
    public class ApplicationOAuthProvider : OAuthAuthorizationServerProvider
    {
        private readonly string _publicClientId;

        public ApplicationOAuthProvider(string publicClientId)
        {
            if (publicClientId == null)
            {
                throw new ArgumentNullException("publicClientId");
            }

            _publicClientId = publicClientId;
        }

        public override async Task GrantResourceOwnerCredentials(OAuthGrantResourceOwnerCredentialsContext context)
        {
            var userManager = context.OwinContext.GetUserManager<ApplicationUserManager>();

            ApplicationUser user = await userManager.FindAsync(context.UserName, context.Password);

            if (user == null)
            {
                context.SetError("invalid_grant", "The user name or password is incorrect.");
                return;
            }
            // Login track -- 
            //IAuthenticationSessionStore["UserProfile"] 
            //LoginTrackController lc = new LoginTrackController();
            //LoginTrackModel ltm = new LoginTrackModel();
            //ltm.CreatedBy_ID = 1;
            //ltm.AuthenticationType = 1;
            //ltm.IPAddress = context.Request.RemoteIpAddress;
            //ltm.MacAddress = context.Request.Host.Value;
            //ltm.DeviceName = "DEviceNAme";
            //ltm.DeviceType = "DeviceType";
            //HttpResponseMessage hr = await lc.Save(ltm);
            //
            ClaimsIdentity oAuthIdentity = await user.GenerateUserIdentityAsync(userManager,
               OAuthDefaults.AuthenticationType);
            ClaimsIdentity cookiesIdentity = await user.GenerateUserIdentityAsync(userManager,
                CookieAuthenticationDefaults.AuthenticationType);

            AuthenticationProperties properties = CreateProperties(user.Id, user.UserName,user.SchoolID.ToString(),user.GroupID.ToString(),user.Sessionyear.ToString());
            AuthenticationTicket ticket = new AuthenticationTicket(oAuthIdentity, properties);
            context.Validated(ticket);
            context.Request.Context.Authentication.SignIn(cookiesIdentity);
        }

        public override Task TokenEndpoint(OAuthTokenEndpointContext context)
        {
            foreach (KeyValuePair<string, string> property in context.Properties.Dictionary)
            {
                context.AdditionalResponseParameters.Add(property.Key, property.Value);
            }

            return Task.FromResult<object>(null);
        }

        public override Task ValidateClientAuthentication(OAuthValidateClientAuthenticationContext context)
        {
            // Resource owner password credentials does not provide a client ID.
            if (context.ClientId == null)
            {
                context.Validated();
            }

            return Task.FromResult<object>(null);
        }

        public override Task ValidateClientRedirectUri(OAuthValidateClientRedirectUriContext context)
        {
            if (context.ClientId == _publicClientId)
            {
                Uri expectedRootUri = new Uri(context.Request.Uri, "/");

                if (expectedRootUri.AbsoluteUri == context.RedirectUri)
                {
                    context.Validated();
                }
            }

            return Task.FromResult<object>(null);
        }
       

        public static AuthenticationProperties CreateProperties(string Id ,string userName,string schoolId,string groupId,string sessionYear)
        {
            IDictionary<string, string> data = new Dictionary<string, string>
            {
                {"Id",Id },             
                { "userName", userName },
                { "schoolId",schoolId},
                {"groupId",groupId },
                {"sessionYear",sessionYear }
            };
            return new AuthenticationProperties(data);
        }
    }
}
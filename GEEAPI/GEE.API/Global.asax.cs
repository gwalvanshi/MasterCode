using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using GEE.Business.Manager;
using Newtonsoft.Json.Serialization;

namespace GEE.API
{
    public class WebApiApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            AutoMapperConfig.Initialize();
            AreaRegistration.RegisterAllAreas();
            GlobalConfiguration.Configure(WebApiConfig.Register);
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
            JsonConfig.Configure();
        }
        public class LowercaseContractResolver : DefaultContractResolver
        {
            protected override string ResolvePropertyName(string propertyName)
            {
                return propertyName.ToLower();
            }
        }
        public static class JsonConfig
        {
            public static void Configure()
            {
                var formatters = GlobalConfiguration.Configuration.Formatters;
                var jsonFormatter = formatters.JsonFormatter;
                var settings = jsonFormatter.SerializerSettings;
                settings.ContractResolver = new LowercaseContractResolver();
            }
        }

    }
}

using System.Web.Mvc;

namespace GEE_Web.Areas.SchoolSetup
{
    public class SchoolSetupAreaRegistration : AreaRegistration
    {
        public override string AreaName
        {
            get
            {
                return "SchoolSetup";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context)
        {
            context.MapRoute(
                "SchoolSetup_default",
                "SchoolSetup/{controller}/{action}/{id}",
                new { action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}
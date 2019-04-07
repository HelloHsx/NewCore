using System.Web.Mvc;

namespace Net4HouTai.Areas.GJ
{
    public class GJAreaRegistration : AreaRegistration 
    {
        public override string AreaName 
        {
            get 
            {
                return "GJ";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context) 
        {
            context.MapRoute(
                "GJ_default",
                "GJ/{controller}/{action}/{id}",
                new { action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}
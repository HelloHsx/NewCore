using System.Web.Mvc;

namespace Net4HouTai.Areas.CJ
{
    public class CJAreaRegistration : AreaRegistration 
    {
        public override string AreaName 
        {
            get 
            {
                return "CJ";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context) 
        {
            context.MapRoute(
                "CJ_default",
                "CJ/{controller}/{action}/{id}",
                new { action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}
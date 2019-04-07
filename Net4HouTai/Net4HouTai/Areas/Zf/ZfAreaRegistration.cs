using System.Web.Mvc;

namespace Net4HouTai.Areas.Zf
{
    public class ZfAreaRegistration : AreaRegistration 
    {
        public override string AreaName 
        {
            get 
            {
                return "Zf";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context) 
        {
            context.MapRoute(
                "Zf_default",
                "Zf/{controller}/{action}/{id}",
                new { action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}
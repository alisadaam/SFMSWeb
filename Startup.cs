using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(SFMSWeb.Startup))]
namespace SFMSWeb
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}

package admin

import (
	"os"
	"runtime"

	"github.com/TeamFat/FatShare-Jay/models"
	"github.com/astaxie/beego"
)

type IndexController struct {
	baseController
}

func (this *IndexController) Index() {

	this.Data["version"] = beego.AppConfig.String("AppVer")
	this.Data["adminid"] = this.userid
	this.Data["adminname"] = this.username

	this.TplName = this.moduleName + "/index/index.html"
}

func (this *IndexController) Main() {

	this.Data["hostname"], _ = os.Hostname()
	this.Data["version"] = beego.AppConfig.String("AppVer")
	this.Data["gover"] = runtime.Version()
	this.Data["os"] = runtime.GOOS
	this.Data["cpunum"] = runtime.NumCPU()
	this.Data["arch"] = runtime.GOARCH

	this.Data["usernum"], _ = new(models.User).Query().Count()

	this.display()
}

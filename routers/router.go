package routers

import (
	"github.com/TeamFat/FatShare-Jay/controllers"
	"github.com/astaxie/beego"
)

func init() {
    beego.Router("/", &controllers.MainController{})
}

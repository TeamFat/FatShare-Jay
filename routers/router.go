package routers

import (
	"github.com/TeamFat/FatShare-Jay/controllers/admin"
	"github.com/astaxie/beego"
)

func init() {
	beego.Router("/admin", &admin.IndexController{}, "*:Index")
	beego.Router("/admin/main", &admin.IndexController{}, "*:Main")
	beego.Router("/admin/login", &admin.AccountController{}, "*:Login")
}

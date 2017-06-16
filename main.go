package main

import (
	"github.com/TeamFat/FatShare-Jay/models"
	_ "github.com/TeamFat/FatShare-Jay/routers"
	"github.com/TeamFat/FatShare-Jay/util"
	"github.com/astaxie/beego"
)

func init() {
	util.Factory.Set("cache", func() (interface{}, error) {
		mc := util.NewLruCache(1000)
		return mc, nil
	})

	models.Init()
}

func main() {
	beego.Run()
}

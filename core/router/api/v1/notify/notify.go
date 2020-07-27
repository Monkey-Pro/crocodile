package notify

import (
	"context"

	"crocodile/common/log"
	"crocodile/core/config"
	"crocodile/core/model"
	"crocodile/core/utils/resp"
	"github.com/gin-gonic/gin"
	"go.uber.org/zap"
)

// GetNotify get self notify
func GetNotify(c *gin.Context) {
	ctx, cancel := context.WithTimeout(context.Background(),
		config.CoreConf.Server.DB.MaxQueryTime.Duration)
	defer cancel()
	uid := c.GetString("uid")
	notifys, err := model.GetNotifyByUID(ctx, uid)
	if err != nil {
		log.Error("model.GetNotify failed", zap.Error(err))
		resp.JSON(c, resp.ErrInternalServer, nil)
		return
	}
	resp.JSON(c, resp.Success, notifys)
	return
}

// ReadNotify make notify status is read
func ReadNotify(c *gin.Context) {
	ctx, cancel := context.WithTimeout(context.Background(),
		config.CoreConf.Server.DB.MaxQueryTime.Duration)
	defer cancel()

	type notifyid struct {
		ID int `json:"id"`
	}
	nuid := notifyid{}
	err := c.ShouldBindJSON(&nuid)
	if err != nil {
		log.Error("c.ShouldBindJSON failed", zap.Error(err))
		resp.JSON(c, resp.ErrBadRequest, nil)
		return
	}
	err = model.NotifyRead(ctx, nuid.ID, c.GetString("uid"))
	if err != nil {
		log.Error("model.NotifyRead failed", zap.Error(err))
		resp.JSON(c, resp.ErrInternalServer, nil)
		return
	}
	resp.JSON(c, resp.Success, nil)
}

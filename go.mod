module crocodile

go 1.13

require (
	github.com/BurntSushi/toml v0.3.1
	github.com/alecthomas/template v0.0.0-20190718012654-fb15b899a751
	github.com/casbin/casbin/v2 v2.1.2
	github.com/casbin/gorm-adapter/v2 v2.0.3
	github.com/dgrijalva/jwt-go v3.2.0+incompatible
	github.com/elazarl/go-bindata-assetfs v1.0.0
	github.com/gin-contrib/pprof v1.2.1
	github.com/gin-gonic/gin v1.5.0
	github.com/go-redis/redis v6.15.7+incompatible
	github.com/go-sql-driver/mysql v1.5.0
	github.com/gogf/gf v1.13.0
	github.com/golang/protobuf v1.3.3
	github.com/gorhill/cronexpr v0.0.0-20180427100037-88b0669f7d75
	github.com/gorilla/websocket v1.4.1
	github.com/grpc-ecosystem/go-grpc-middleware v1.1.0
	github.com/labulaka521/crocodile v1.1.6
	github.com/mattn/go-sqlite3 v1.11.0
	github.com/pkg/errors v0.8.1
	github.com/prometheus/client_golang v1.1.0
	github.com/soheilhy/cmux v0.1.4
	github.com/spf13/cobra v0.0.5
	github.com/swaggo/gin-swagger v1.2.0
	github.com/swaggo/swag v1.6.5
	go.uber.org/zap v1.12.0
	golang.org/x/crypto v0.0.0-20191108234033-bd318be0434a
	golang.org/x/text v0.3.2
	google.golang.org/grpc v1.25.1
	gopkg.in/natefinch/lumberjack.v2 v2.0.0
	gopkg.in/tucnak/telebot.v2 v2.0.0-20200120165535-b6c3367fed99
)

replace gopkg.in/jcmturner/rpc.v1 => gopkg.in/jcmturner/rpc.v1 v1.1.0

// +heroku goVersion go1.13

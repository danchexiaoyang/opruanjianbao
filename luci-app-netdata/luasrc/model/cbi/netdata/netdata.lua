-- 版权所有 2018-2022 sirpdboy (herboy2008@gmail.com)
-- https://github.com/sirpdboy/luci-app-netdata
require("luci.util")

local m, s, o

m = Map("netdata", translate("实时监控"), translate("Netdata 是一个高保真基础设施监控和故障排除工具。开源、免费、预配置、有主见，并且始终实时。") .. translate("</br>具体用法，请参见：") .. translate("<a href='https://github.com/sirpdboy/luci-app-netdata.git' target='_blank'>GitHub @sirpdboy/luci-app-netdata</a>"))
m:section(SimpleSection).template = "netdata_status"
s = m:section(TypedSection, "netdata", translate("全局设置"))
s.addremove = false
s.anonymous = true

o = s:option(Flag, "enabled", translate("启用"))
o.default = 0

o = s:option(Value, "port", translate("设置 netdata 访问端口"))
o.datatype = "uinteger"
o.default = 19999

m.apply_on_parse = true
m.on_after_apply = function(self, map)
	luci.sys.exec("/etc/init.d/netdata start")
end

return m

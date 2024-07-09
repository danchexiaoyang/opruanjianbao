-- 版权所有 (C) 2018-2022 sirpdboy <herboy2008@gmail.com> https://github.com/sirpdboy/luci-app-netdata
-- 根据 Apache 许可证 2.0 公开许可。

module("luci.controller.netdata", package.seeall)

function index()
	if not nixio.fs.access("/etc/config/netdata") then
		return
	end
	local page
	entry({"admin", "status", "netdata"}, alias("admin", "status", "netdata", "setting"), _("实时监控"), 10).dependent = true

	entry({"admin", "status", "netdata", "setting"}, cbi("netdata/netdata"), _("基本设置"), 20).leaf = true
	entry({"admin", "status", "netdata", "netdata"}, template("netdata"), _("实时监控"), 30).leaf = true
	entry({"admin", "status", "netdata_status"}, call("act_status"))
end

function act_status()
	local sys  = require "luci.sys"
	local e = { }
	e.running = sys.call("pidof netdata >/dev/null") == 0
	luci.http.prepare_content("application/json")
	luci.http.write_json(e)
end

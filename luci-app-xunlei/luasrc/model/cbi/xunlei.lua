local m, s

m = Map("xunlei", translate("迅雷"))
m.description = translate("NAS 迅雷 DSM 7.x 测试版") .. "<br/>" .. translate("邀请码:") .. "<font color='#00bd3e'>网心超牛</font>"

m:section(SimpleSection).template = "xunlei/xunlei_status"

s = m:section(TypedSection, "xunlei")
s.addremove = false
s.anonymous = true

o = s:option(Flag, "enabled", translate("启用"))
o.rmempty = false

o = s:option(Value, "port", translate("端口"))
o.datatype = "and(port,min(1))"
o.default = "5051"
o.rmempty = false

o = s:option(Value, "username", translate("用户名"))
o.datatype = "string"

o = s:option(Value, "password", translate("密码"))
o.description = translate("留空则禁用身份验证")
o.datatype = "string"
o.password = true

o = s:option(Value, "config_path", translate("数据存储路径"))
o.default = "/etc/xunlei"

o = s:option(Value, "download_dir", translate("默认下载路径"))
o.default = "/mnt"

return m

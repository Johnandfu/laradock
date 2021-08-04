--[[
Author: your name
Date: 2020-08-22 09:49:36
LastEditTime: 2020-11-18 11:39:21
LastEditors: Please set LastEditors
Description: In User Settings Edit
FilePath: \laradock\param.lua
--]]
request = function()
    path = "&user_id=8605&act=distribution/withDraw&amount=1"
    return wrk.format("GET", path)
 end

 /usr/local/bin/docker-compose -f /var/www/seelea/laradock/docker-compose.yml up -d ss ssr mysql
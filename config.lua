if string.sub(system.getInfo("model"),1,4) == "iPad" then
	application = 
	{
			content =
			{
					width = 950,
					height = 1350,
					scale = "zoomStretch",
					xAlign = "center",
					yAlign = "center",
					imageSuffix = 
					{
							["@2x"] = 1.5,
							["@4x"] = 3.0,
					},
			},
			notification = 
			{
					iphone = {
							types = {
									"badge", "sound", "alert"
							}
					}
			}
	}

elseif string.sub(system.getInfo("model"),1,2) == "iP" and display.pixelHeight > 960 then
	application = 
	{
			content =
			{
					width = 800,
					height = 1420,
					scale = "zoomStretch",
					xAlign = "center",
					yAlign = "center",
					imageSuffix = 
					{
							["@2x"] = 1.5,
							["@4x"] = 3.0,
					},
			},
			notification = 
			{
					iphone = {
							types = {
									"badge", "sound", "alert"
							}
					}
			}
	}

elseif string.sub(system.getInfo("model"),1,2) == "iP" then
	application = 
	{
			content =
			{
					width = 835,
					height = 1380,
					scale = "zoomStretch",
					xAlign = "center",
					yAlign = "center",
					imageSuffix = 
					{
							["@2x"] = 1.5,
							["@4x"] = 3.0,
					},
			},
			notification = 
			{
					iphone = {
							types = {
									"badge", "sound", "alert"
							}
					}
			}
	}
elseif display.pixelHeight / display.pixelWidth > 1.72 then
	application = 
	{
			content =
			{
					width = 800,
					height = 1440,
					scale = "zoomStretch",
					xAlign = "center",
					yAlign = "center",
					imageSuffix = 
					{
							["@2x"] = 1.5,
							["@4x"] = 3.0,
					},
			},
	}
else
	application = 
	{
			content =
			{
					width = 800,
					height = 1380,
					scale = "zoomStretch",
					xAlign = "center",
					yAlign = "center",
					imageSuffix = 
					{
							["@2x"] = 1.5,
							["@4x"] = 3.0,
					},
			},
			notification = 
			{
					iphone = {
							types = {
									"badge", "sound", "alert"
							}
					}
			}
	}
end
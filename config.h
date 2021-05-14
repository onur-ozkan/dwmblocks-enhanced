//Modify this file to change what commands output to your statusbar, and recompile using the make command.

static const Block blocks[] = {
	/*Command*/		/*Update Interval*/	/*Update Signal*/
	{ "dwm_memory",		3,		0	},
	{ "dwm_kernel",		0,		0	},
	{ "dwm_cpu_temp",	    3,		0	},
	// { "dwm_date",		    3600,	0	},
	{ "dwm_brightness",	0,		11	},
	{ "dwm_volume",		0,		10	},
	{ "dwm_network",	    3,	    0   },
	// { "dwm_traffic",	    1,	    0   },
	{ "dwm_battery",		3,		0	},
	{ "dwm_clock",		3,		0	},
	{ "dwm_keyboard_layout",	0,		12	},
	{ "dwm_uptime",		60,		0	},
};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim[] = " ";
static unsigned int delimLen = 1;

mod_cookie_domain.la: mod_cookie_domain.slo
	$(SH_LINK) -rpath $(libexecdir) -module -avoid-version  mod_cookie_domain.lo
DISTCLEAN_TARGETS = modules.mk
shared =  mod_cookie_domain.la

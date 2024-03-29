<!DOCTYPE html>

<#include init />

<html class="${root_css_class}" dir="<@liferay.language key="lang.dir" />" lang="${w3c_language_id}">

<head>
	<title>${the_title} - ${company_name}</title>

	<meta content="initial-scale=1.0, width=device-width" name="viewport" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

	${theme.include(top_head_include)}

	<script src="${javascript_folder}/fixes/modernizr.custom.js"></script>
	<!--[if (gte IE 6)&(lte IE 8)]>
		<script type="text/javascript" src="${javascript_folder}/selectivizr.js"></script>
	<![endif]-->

</head>

<body class="${css_class}">

<a href="#main-content" id="skip-to-content"><@liferay.language key="skip-to-content" /></a>

${theme.include(body_top_include)}

<#if show_page_edit>
	<@liferay.dockbar />
</#if>

<div class="container-fluid" id="wrapper">

	<header id="header" role="banner" class="header-alt-1">

		<#if top_alert_article_id?has_content>
			<div id="topAlert">
				<div class="container-normal">
					<@includeWCD group_id=group_id article_id=top_alert_article_id />
				</div>
			</div>
		</#if>

		<a href="#mobileMenuTrigger" id="mobileMenuTrigger">
	        <span class="sr-only">Meny</span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	    </a>


		<div id="topBar">
			<div class="container-normal">

				<a class="logo-vgr ${logo_css_class}" href="/">

					<#assign logo_src = images_folder + "/theme/logo/vgr-logo-white.png" />

					<#if layout.layoutSet.isLogo()>
						<#assign logo_src = site_logo />
					</#if>

					<img src="${logo_src}" alt="V&auml;stra G&ouml;talandsregionen" />
				</a>

				<div class="top-bar-tools">

					<div class="top-bar-navigation">

						<#if topnav_article_id?has_content>
							<@includeWCD group_id=group_id article_id=topnav_article_id />
						</#if>

						<#if !is_signed_in>
							<a href="${sign_in_url}" data-redirect="${is_login_redirect_required?string}" id="signIn" class="signin" rel="nofollow">${sign_in_text}</a>
						<#else>
							<a href="${sign_out_url}" id="signOut" class="signout" rel="nofollow">${sign_out_text}</a>
						</#if>

					</div>
					<#if show_search>
						<span class="top-search searchbox">
							<#include "${full_templates_path}/search.ftl" />
						</span>
					</#if>
				</div>

			</div>
		</div>

		<div id="navBar">
			<div class="container-normal">

					<div class="tools-wrap">
						<#include "${full_templates_path}/nav_bar_tools.ftl" />
					</div>

					<div class="navigation-wrap">
						<#if has_navigation || is_signed_in>
							<#--
								<#include "${full_templates_path}/navigation.ftl" />
							-->
							<#include "${full_templates_path}/navigation-with-drop.ftl" />
						</#if>
					</div>
			</div>
		</div>


	</header>

	<div id="content">
		<div class="container-normal">

			<#if show_breadcrumbs>
				<nav id="breadcrumbs">
					<@liferay_ui.breadcrumb showGuestGroup=false showCurrentGroup=false showLayout=true showCurrentPortlet=true showPortletBreadcrumb=true />
				</nav>
			</#if>

			<#if selectable>
				${theme.include(content_include)}
			<#else>
				${portletDisplay.recycle()}

				${portletDisplay.setTitle(the_title)}

				${theme.wrapPortlet("portlet.ftl", content_include)}
			</#if>
		</div>
	</div>

	<div class="footer-push"></div>

</div>
<#include "${full_templates_path}/footer.ftl" />


${theme.include(body_bottom_include)}

${theme.include(bottom_include)}

<script type="text/javascript" src="${javascript_folder}/pojs/classie.js"></script>
<script type="text/javascript" src="${javascript_folder}/pojs/pojs.js"></script>

<script type="text/javascript" src="${javascript_folder}/modules/ifeed-consumer.js"></script>

<script type="text/javascript" src="${javascript_folder}/modules/vgrintra-megadrop.js"></script>
<script type="text/javascript" src="${javascript_folder}/modules/vgrintra-theme-main.js"></script>
<script type="text/javascript" src="${javascript_folder}/theme-main.js"></script>

</body>

</html>

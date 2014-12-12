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

<#if is_signed_in>
	<@liferay.dockbar />
</#if>

<div class="container-fluid" id="wrapper">

	<header id="header" role="banner">

		<div id="topBar">
				<div class="container-normal">

					<a class="logo-vgr" href="http://www.vgregion.se">
						<img src="${images_folder}/theme/logo/vgr-logo-white.png" alt="V&auml;stra G&ouml;talandsregionen" />
					</a>

					<div class="top-bar-tools">

						<#if topnav_article_id?has_content>
							<@includeWCD group_id=group_id article_id=topnav_article_id />
						</#if>

						<#if !is_signed_in>
							<a href="${sign_in_url}" data-redirect="${is_login_redirect_required?string}" id="sign-in" rel="nofollow">${sign_in_text}</a>
						<#else>
							<a href="${sign_out_url}" id="sign-out" rel="nofollow">${sign_out_text}</a>
						</#if>
					</div>


				</div>
		</div>

		<div id="navBar">
			<div class="container-normal">
				<div class="row-fluid">

					<div class="span2">
						<a class="logo-anslaget" href="/">
							<img src="${images_folder}/theme/logo/anslaget-logo.png" alt="ANSlaget" />
						</a>
					</div>

					<div class="span8">

						<#if has_navigation || is_signed_in>
							<#include "${full_templates_path}/navigation.ftl" />
						</#if>

					</div>

					<div class="span2">

						<div id="sbSearch" class="sb-search">
							<form>
								<input class="sb-search-input" placeholder="S&ouml;k..." type="text" value="" name="search" id="search">
								<input class="sb-search-submit" type="submit" value="">
								<span class="sb-icon-search icon-search"></span>
							</form>
						</div>


					</div>


				</div>
			</div>
		</div>


	</header>

	<div id="content">
		<div class="container-normal">
			<#--
				<nav id="breadcrumbs"><@liferay.breadcrumbs /></nav>
			-->

			<#if selectable>
				${theme.include(content_include)}
			<#else>
				${portletDisplay.recycle()}

				${portletDisplay.setTitle(the_title)}

				${theme.wrapPortlet("portlet.ftl", content_include)}
			</#if>
		</div>

	</div>

	<footer id="footer" role="contentinfo">
		<div class="container-normal"></div>
	</footer>

</div>

${theme.include(body_bottom_include)}

${theme.include(bottom_include)}

<script type="text/javascript" src="${javascript_folder}/pojs/classie.js"></script>
<script type="text/javascript" src="${javascript_folder}/pojs/uisearch.js"></script>
<script type="text/javascript" src="${javascript_folder}/pojs/pojs.js"></script>

<script type="text/javascript" src="${javascript_folder}/jq/jq.js"></script>
<script type="text/javascript" src="${javascript_folder}/jq/theme-jq.js"></script>

</body>

</html>

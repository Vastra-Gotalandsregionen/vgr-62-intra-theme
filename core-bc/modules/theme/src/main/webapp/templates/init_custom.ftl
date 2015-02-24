<#------ Taglibs ----------------------------------------------------------------------------------------------------------------->

<#assign liferay_ui=PortalJspTagLibs["/WEB-INF/tld/liferay-ui.tld"]>
<#assign aui=PortalJspTagLibs["/WEB-INF/tld/liferay-aui.tld"]>

<#------ Define services ----------------------------------------------------------------------------------------------------------------->

<#assign expandoValueLocalService = serviceLocator.findService("com.liferay.portlet.expando.service.ExpandoValueLocalService") />
<#assign layoutLocalService = serviceLocator.findService("com.liferay.portal.service.LayoutLocalService") />
<#assign journalArticleLocalService = serviceLocator.findService("com.liferay.portlet.journal.service.JournalArticleLocalService") />

<#assign portletItemLocalService = serviceLocator.findService("com.liferay.portal.service.PortletItemLocalService") />
<#assign portletPreferencesLocalService = serviceLocator.findService("com.liferay.portal.service.PortletPreferencesLocalService") />
<#assign userGroupLocalService = serviceLocator.findService("com.liferay.portal.service.UserGroupLocalService") />

<#------ Define variables ----------------------------------------------------------------------------------------------------------------->

<#assign show_breadcrumbs = true />

<#------ Portlet Ids ----------------------------------------------------------------------------------------------------------------->

<#assign bookmarks_portlet_id = "intrabookmarks_WAR_bookmarksjsfportlet" />

<#------ Expando values ----------------------------------------------------------------------------------------------------------------->

<#assign hero_article_id = expandoValueLocalService.getData(company_id, "com.liferay.portal.model.Group", "CUSTOM_FIELDS", "vgr-intra-hero-article-id", group_id, "")  />

<#assign topnav_article_id = expandoValueLocalService.getData(company_id, "com.liferay.portal.model.Group", "CUSTOM_FIELDS", "vgr-intra-topnav-article-id", group_id, "")  />

<#assign top_alert_article_id = expandoValueLocalService.getData(company_id, "com.liferay.portal.model.Group", "CUSTOM_FIELDS", "vgr-intra-top-alert-article-id", group_id, "")  />

<#------ Theme Settings ----------------------------------------------------------------------------------------------------------------->

<#--
-->
	<#if theme_display.getThemeSetting("show-breadcrumbs") == "false">
		<#assign show_breadcrumbs = false />
	</#if>

<#------ Permissions Checker ----------------------------------------------------------------------------------------------------------------->

<#assign permission_checker = theme_display.getPermissionChecker() />

<#assign is_scope_group_admin = permission_checker.isGroupAdmin(group_id) />
<#assign is_scope_group_owner = permission_checker.isGroupOwner(group_id) />

<#assign is_omni_admin = permission_checker.isOmniadmin() />

<#------ Favorites ----------------------------------------------------------------------------------------------------------------->

<#assign use_favorites_quickadd = true />

<#assign favorites_quickadd_portlet_id = "favoritesquickadd_WAR_oppnaprogramfavoritesportlet" />


<#------ Page Edit Mode ----------------------------------------------------------------------------------------------------------------->
<#------ Whether or not portlet titles and other UI components should be displayed. Also used to show/hide dockbar.  ------>

<#assign show_page_edit = false />

<#-- Include Omni Admin -->
<#assign show_page_edit = show_page_edit || is_omni_admin />

<#-- Include Scope Group Owner -->
<#assign show_page_edit = show_page_edit || is_scope_group_owner />

<#-- Include Scope Group Admin -->
<#assign show_page_edit = show_page_edit || is_scope_group_admin />

<#if show_page_edit>
	<#assign css_class = css_class + " page-edit dockbar-split" />
</#if>


<#------ Macros -------------------------------------------------->

<#-- Include Web Content Display portlet in theme. attribute: group_id is long, article_id is String-->

<#macro includeWCD group_id article_id>
	<#if article_id != "">

		<#local portlet_instance_suffix = "vgrintra" />
		<#local instance_id = "wcd" + article_id + portlet_instance_suffix />
		<#local instance_id = instance_id?substring(0, 12) />
		<#local portlet_id = "56_INSTANCE_" + instance_id />

		${freeMarkerPortletPreferences.reset()}

		${freeMarkerPortletPreferences.setValue("portletSetupShowBorders","false")}
		${freeMarkerPortletPreferences.setValue("groupId", group_id?c)}
		${freeMarkerPortletPreferences.setValue("articleId", article_id)}

		${theme.runtime(portlet_id, "", freeMarkerPortletPreferences)}
		${freeMarkerPortletPreferences.reset()}
	<#else>
		&nbsp;
	</#if>
</#macro>

<#macro includePortlet portlet_id>

		${freeMarkerPortletPreferences.reset()}

		${freeMarkerPortletPreferences.setValue("portletSetupShowBorders","false")}

		${theme.runtime(portlet_id, "", freeMarkerPortletPreferences)}
		${freeMarkerPortletPreferences.reset()}
</#macro>

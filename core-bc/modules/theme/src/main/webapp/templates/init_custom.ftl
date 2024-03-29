<#------ Taglibs ----------------------------------------------------------------------------------------------------------------->

<#assign liferay_ui=PortalJspTagLibs["/WEB-INF/tld/liferay-ui.tld"]>
<#assign aui=PortalJspTagLibs["/WEB-INF/tld/liferay-aui.tld"]>

<#------ Define services ----------------------------------------------------------------------------------------------------------------->

<#assign expandoValueLocalService = serviceLocator.findService("com.liferay.portlet.expando.service.ExpandoValueLocalService") />
<#assign layoutLocalService = serviceLocator.findService("com.liferay.portal.service.LayoutLocalService") />
<#assign journalArticleLocalService = serviceLocator.findService("com.liferay.portlet.journal.service.JournalArticleLocalService") />

<#assign portletItemLocalService = serviceLocator.findService("com.liferay.portal.service.PortletItemLocalService") />
<#assign portletPreferencesLocalService = serviceLocator.findService("com.liferay.portal.service.PortletPreferencesLocalService") />
<#assign roleLocalService = serviceLocator.findService("com.liferay.portal.service.RoleLocalService") />
<#assign userGroupLocalService = serviceLocator.findService("com.liferay.portal.service.UserGroupLocalService") />

<#------ Define variables ----------------------------------------------------------------------------------------------------------------->

<#assign show_breadcrumbs = !is_first_parent />

<#------ Portlet Ids ----------------------------------------------------------------------------------------------------------------->

<#assign bookmarks_portlet_id = "intrabookmarks_WAR_bookmarksjsfportlet" />

<#------ Expando values ----------------------------------------------------------------------------------------------------------------->

<#assign hero_article_id = expandoValueLocalService.getData(company_id, "com.liferay.portal.model.Group", "CUSTOM_FIELDS", "vgr-intra-hero-article-id", group_id, "")  />

<#assign topnav_article_id = expandoValueLocalService.getData(company_id, "com.liferay.portal.model.Group", "CUSTOM_FIELDS", "vgr-intra-topnav-article-id", group_id, "")  />

<#assign top_alert_article_id = expandoValueLocalService.getData(company_id, "com.liferay.portal.model.Group", "CUSTOM_FIELDS", "vgr-intra-top-alert-article-id", group_id, "")  />

<#assign footer_col_1_article_id = expandoValueLocalService.getData(company_id, "com.liferay.portal.model.Group", "CUSTOM_FIELDS", "vgr-intra-footer-col-1-article-id", group_id, "")  />
<#assign footer_col_2_article_id = expandoValueLocalService.getData(company_id, "com.liferay.portal.model.Group", "CUSTOM_FIELDS", "vgr-intra-footer-col-2-article-id", group_id, "")  />


<#assign search_layout_friendly_url = expandoValueLocalService.getData(company_id, "com.liferay.portal.model.Group", "CUSTOM_FIELDS", "vgr-intra-search-layout-friendly-url", group_id, "")  />
<#assign search_layout_column_id = expandoValueLocalService.getData(company_id, "com.liferay.portal.model.Group", "CUSTOM_FIELDS", "vgr-intra-search-layout-column-id", group_id, "")  />


<#if search_layout_friendly_url = "">
	<#assign search_layout_friendly_url = "/sok" />
</#if>

<#if search_layout_column_id = "">
	<#assign search_layout_column_id = "1" />
</#if>

<#------ Theme Settings ----------------------------------------------------------------------------------------------------------------->

<#assign show_search = false />

<#assign theme_setting_show_search = theme_display.getThemeSetting("show-search")! />

<#if theme_setting_show_search = "true">
	<#assign show_search = true />
</#if>

<#------ Permissions Checker ----------------------------------------------------------------------------------------------------------------->

<#assign permission_checker = theme_display.getPermissionChecker() />

<#assign is_scope_group_admin = permission_checker.isGroupAdmin(group_id) />
<#assign is_scope_group_owner = permission_checker.isGroupOwner(group_id) />

<#assign is_omni_admin = permission_checker.isOmniadmin() />


<#assign has_user_dockbar_role = false />
<#assign dockbarRole = roleLocalService.fetchRole(company_id, "Site Dockbar")! />
<#if dockbarRole?has_content>
	<#assign userGroupRoles = roleLocalService.getUserGroupRoles(user_id, group_id) />
	<#list userGroupRoles as userGroupRole>
		<#if userGroupRole.getRoleId() == dockbarRole.getRoleId()>
			<#assign has_user_dockbar_role = true />
		</#if>
	</#list>
</#if>

<#-- temporary only show seach for omni admin and scope group owner/admin -->
<#--
<#if show_search && (is_omni_admin || is_scope_group_admin || is_scope_group_owner)>
	<#assign show_search = true />
<#else>
	<#assign show_search = false />
</#if>
-->

<#------ Favorites ----------------------------------------------------------------------------------------------------------------->

<#assign use_favorites_quickadd = true />

<#assign favorites_quickadd_portlet_id = "favoritesquickadd_WAR_oppnaprogramfavoritesportlet" />

<#------ Links ----------------------------------------------------------------------------------------------------------------->

<#assign vgr_logo_link = "http://intra.vgregion.se/sv/Insidan/" />


<#------ Page Edit Mode ----------------------------------------------------------------------------------------------------------------->
<#------ Whether or not portlet titles and other UI components should be displayed. Also used to show/hide dockbar.  ------>

<#assign show_page_edit = false />

<#-- Include Omni Admin -->
<#assign show_page_edit = show_page_edit || is_omni_admin || has_user_dockbar_role />

<#-- Include Scope Group Owner -->
<#assign show_page_edit = show_page_edit || is_scope_group_owner />

<#-- Include Scope Group Admin -->
<#assign show_page_edit = show_page_edit || is_scope_group_admin />

<#if show_page_edit>
	<#assign css_class = css_class + " page-edit dockbar-split_ dockbar-fixed" />
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

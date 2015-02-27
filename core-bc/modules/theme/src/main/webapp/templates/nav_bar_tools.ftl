<div class="navbar-tools">
  <#--
  <div class="navbar-tools-item">
    <a href="/kris-och-katastrof" class="panic-btn">
      <span>
        <@liferay_ui.message key="Vid Kris" />
      </span>
    </a>
  </div>
  -->
    <#if use_favorites_quickadd >
      <div class="navbar-tools-item">
        <div id="favorites">
          <@includePortlet portlet_id=favorites_quickadd_portlet_id />
        </div>
      </div>
    </#if>

</div>

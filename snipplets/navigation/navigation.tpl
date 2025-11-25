<div class="nav-desktop">
    <ul class="js-nav-desktop-list nav-desktop-list" data-store="navigation" data-component="menu">
        {% include 'snipplets/navigation/navigation-nav-list.tpl' with {'desktop_nav': true, 'navigation': navigation[:(navigation | length) / 2]} %}
    </ul>


    <ul class="js-nav-desktop-list nav-desktop-list" data-store="navigation" data-component="menu">
        {% include 'snipplets/navigation/navigation-nav-list.tpl' with {'desktop_nav': true, 'navigation': navigation[(navigation | length) / 2:]} %}
    </ul>
</div>
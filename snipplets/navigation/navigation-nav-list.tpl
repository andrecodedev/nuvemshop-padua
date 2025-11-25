{% set desktop_nav = desktop_nav | default(false) %}
{% set mobile_nav = mobile_nav | default(false) %}
{% set subitem = subitem | default(false) %}

{% set use_defaults = not settings.disable_defaults_site and not settings.disable_defaults_encabezado %}

{% for item in navigation %}
    {# ======== MATCH MAIS INTELIGENTE PARA IMAGEM DO MENU ======== #}
    {% set image_menu = null %}

    {% if settings.menu_images %}
        {% set item_name_norm = item.name | striptags | trim | lower %}
        {% for i in settings.menu_images %}
            {% set title_norm = i.title | default('') | striptags | trim | lower %}
            {% if title_norm == item_name_norm %}
                {% set image_menu = i %}
            {% endif %}
        {% endfor %}
    {% endif %}

    {# ======== FALLBACK GLOBAL OPCIONAL (imagem padrão para todos) ======== #}
    {% if not image_menu and settings.menu_image_default %}
        {% set image_menu = {
            'image': settings.menu_image_default,
            'title': item.name,
            'description': '',
            'button': 'Coleção',
            'link': item.url
        } %}
    {% endif %}

    {# ======== RENDERIZAÇÃO DO MENU ======== #}
    {% if item.subitems %}
        <li class="{% if desktop_nav %}js-item-desktop nav-item-desktop {% if not subitem %}nav-dropdown nav-main-item {% endif %}{% endif %} nav-item item-with-subitems" data-component="menu.item">
            <div class="nav-item-container {% if not desktop_nav %}js-nav-list-toggle-accordion{% endif %}">
                {% if item.name matches '/^destaque:cor:/' %}
                    {% set parts = item.name|split(':') %}
                    {% set color = parts[2] %}
                    {% set text = parts[3]|upper %}
                    <a style="color: {{ color }}" class="{% if not desktop_nav %}js-toggle-page-accordion{% endif %} nav-list-link {{ item.current ? 'selected' : '' }}" href="{% if desktop_nav and item.url %}{{ item.url | setting_url }}{% else %}#{% endif %}">
                        {{ text | default('DESTAQUE') }}
                        {% if not subitem or mobile_nav %}
                            <span class="nav-list-arrow transition-soft">
                                <svg class="icon-inline icon-md"><use xlink:href="#chevron-down"/></svg>
                            </span>
                        {% endif %}
                    </a>
                {% else %}
                    <a class="{% if not desktop_nav %}js-toggle-page-accordion{% endif %} nav-list-link {{ item.current ? 'selected' : '' }}" href="{% if desktop_nav and item.url %}{{ item.url | setting_url }}{% else %}#{% endif %}">{{ item.name | default('Menu item') }}
                        {% if not subitem or mobile_nav %}
                            <span class="nav-list-arrow transition-soft">
                                <svg class="icon-inline icon-md"><use xlink:href="#chevron-down"/></svg>
                            </span>
                        {% endif %}
                    </a>
                {% endif %}
            </div>

            {% if desktop_nav %}
                {% if not subitem %}
                    <div class="js-desktop-dropdown nav-dropdown-content desktop-dropdown">
                {% endif %}
            {% endif %}

            <ul class="{% if desktop_nav %}{% if not subitem %}desktop-list-subitems{% endif %}{% else %}js-pages-accordion{% endif %} list-subitems nav-list-accordion" {% if not desktop_nav %}style="display:none;"{% endif %}>
                {% if not desktop_nav and item.isCategory  %}
                    <li class="nav-item nav-item-desktop">
                        <a class="nav-list-link {{ item.current ? 'selected' : '' }}" href="{{ item.url | default('#') }}">
                            <strong>
                                {% if item.isRootCategory %}
                                    {{ 'Ver todos los productos' | translate }}
                                {% else %}
                                    {{ 'Ver todo en' | translate }}
                                    {% if item.name matches '/^destaque:cor:/' %}
                                        {% set parts = item.name|split(':') %}
                                        {% set color = parts[2] %}
                                        {% set text = parts[3]|upper %}
                                        <span style="color: {{ color }};">{{ text | default('DESTAQUE') }}</span>
                                    {% else %}
                                        {{ item.name | default('Categoria') }}
                                    {% endif %}
                                {% endif %}
                            </strong>
                        </a>
                    </li>
                {% endif %}

                {% if mobile_nav %}
                    {% include 'snipplets/navigation/navigation-nav-list.tpl' with { 'navigation' : item.subitems, 'subitem' : true, 'mobile_nav' : true } %}
                {% else %}
                    {% include 'snipplets/navigation/navigation-nav-list.tpl' with { 'navigation' : item.subitems, 'subitem' : true } %}
                {% endif %}
            </ul>

            {% if desktop_nav %}
                {% if not subitem %}
                    {% if image_menu %}
                        {% if image_menu.image %}
                            {% set image_url = image_menu.image | static_url %}
                        {% else %}
                        {% if use_defaults %}
                            {% set image_url = 'https://placehold.co/300x300?text=300x300+:+Menu+Image' %}
                        {% endif %}
                        {% endif %}
                        <div class="nav-dropdown-image d-none d-md-flex">
                            <img
                                src="{{ 'images/empty-placeholder.png' | static_url }}"
                                data-src="{{ image_url | settings_image_url('large') }}"
                                class="lazyload"
                                alt="{{ store.name | default('Loja') }}">
                            <div class="text-container">
                                <div class="title">{{ image_menu.title | default('Título do menu') }}</div>
                                <div class="description">{{ image_menu.description | default('Descrição do menu ou categoria.') }}</div>
                                <a href="{{ image_menu.link | setting_url | default('#') }}" class="button mt-auto" title="{{ store.name | default('Loja') }}" aria-label="{{ store.name | default('Loja') }}">
                                    VIEW ALL IN {{ image_menu.button | default('Coleção') }}
                                </a>
                            </div>
                        </div>
                    {% else %}
                        {% if use_defaults %}
                        <div class="nav-dropdown-image d-none d-md-flex">
                            <img src="https://placehold.co/300x300?text=300x300+:+Menu+Image" class="lazyload" alt="{{ store.name | default('Loja') }}">
                            <div class="text-container">
                                <div class="title">Título do menu</div>
                                <div class="description">Descrição padrão de menu ou coleção.</div>
                                <a href="#" class="button mt-auto" title="{{ store.name | default('Loja') }}" aria-label="{{ store.name | default('Loja') }}">
                                    VIEW ALL IN Coleção
                                </a>
                            </div>
                        </div>
                        {% endif %}
                    {% endif %}
                    </div>
                {% endif %}
            {% endif %}
        </li>
    {% else %}
        <li class="{% if desktop_nav %}js-item-desktop nav-item-desktop {% if not subitem %}nav-main-item{% endif %}{% endif %} nav-item" data-component="menu.item">
            {% if item.name matches '/^destaque:cor:/' %}
                {% set parts = item.name|split(':') %}
                {% set color = parts[2] %}
                {% set text = parts[3]|upper %}
                <a style="color: {{ color }}" class="nav-list-link {{ item.current ? 'selected' : '' }}" href="{{ item.url | setting_url | default('#') }}">
                    {{ text | default('DESTAQUE') }}
                </a>
            {% else %}
                <a class="nav-list-link {{ item.current ? 'selected' : '' }}" href="{{ item.url | setting_url | default('#') }}">{{ item.name | default('Menu item') }}</a>
            {% endif %}
        </li>
    {% endif %}
{% endfor %}

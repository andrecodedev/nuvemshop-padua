{% set desktop_nav = desktop_nav | default(false) %}
{% set mobile_nav = mobile_nav | default(false) %}
{% set subitem = subitem | default(false) %}

{% for item in navigation %}
	{% set image_menu = null %}
	
	{% for i in settings.menu_images %}
		{% if i.title == item.name %}
			{% set image_menu = i %}
		{% endif %}
	{% endfor %}
	
	{% if item.subitems %}
    	<li class="{% if desktop_nav %}js-item-desktop nav-item-desktop {% if not subitem %}nav-dropdown nav-main-item {% endif %}{% endif %} nav-item item-with-subitems" data-component="menu.item">
    		<div class="nav-item-container {% if not desktop_nav %}js-nav-list-toggle-accordion{% endif %}">
				{% if item.name matches '/^destaque:cor:/' %}
					{% set parts = item.name|split(':') %}
					{% set color = parts[2] %}
					{% set text = parts[3]|upper %}
					<a style="color: {{ color }}" class="{% if not desktop_nav %}js-toggle-page-accordion{% endif %} nav-list-link {{ item.current ? 'selected' : '' }}" href="{% if desktop_nav and item.url %}{{ item.url }}{% else %}#{% endif %}">
						{{ text }}						
						{% if not subitem or mobile_nav %}
							<span class="nav-list-arrow transition-soft">
								<svg class="icon-inline icon-md"><use xlink:href="#chevron-down"/></svg>
							</span>
						{% endif %}
					</a>
				{% else %}
					<a class="{% if not desktop_nav %}js-toggle-page-accordion{% endif %} nav-list-link {{ item.current ? 'selected' : '' }}" href="{% if desktop_nav and item.url %}{{ item.url }}{% else %}#{% endif %}">{{ item.name }}
						{% if not subitem or mobile_nav %}
							<span class="nav-list-arrow transition-soft">
								<svg class="icon-inline icon-md"><use xlink:href="#chevron-down"/></svg>
							</span>
						{% endif %}
					</a>
				{% endif %}
	        </div>
	        {% if desktop_nav %}{% if not subitem %}<div class="js-desktop-dropdown nav-dropdown-content desktop-dropdown">{% endif %}{% endif %}
				<ul class="{% if desktop_nav %}{% if not subitem %}desktop-list-subitems{% endif %}{% else %}js-pages-accordion{% endif %} list-subitems nav-list-accordion" {% if not desktop_nav %}style="display:none;"{% endif %}>
					{% if not desktop_nav and item.isCategory  %}
						<li class="nav-item nav-item-desktop">
							<a class="nav-list-link {{ item.current ? 'selected' : '' }}" href="{{ item.url }}">
								<strong>
									{% if item.isRootCategory %}
										{{ 'Ver todos los productos' | translate }}
									{% else %}
										{{ 'Ver todo en' | translate }} 
										{% if item.name matches '/^destaque:cor:/' %}

										{% set parts = item.name|split(':') %}
										{% set color = parts[2] %}
										{% set text = parts[3]|upper %}

											<span style="color: {{ color }};">{{ text }}</span>
										{% else %}
											{{ item.name }}
										{% endif %}
									{% endif %}
								</strong>
						 	</a>
				        </li>
			        {% endif %}
			        {% if mobile_nav %}
			        	{% include 'snipplets/navigation/navigation-nav-list.tpl' with { 'navigation' : item.subitems, 'subitem' : true, 'mobile_nav' : true  } %}
			        {% else %}
						{% include 'snipplets/navigation/navigation-nav-list.tpl' with { 'navigation' : item.subitems, 'subitem' : true  } %}
			        {% endif %}
				</ul>
			{% if desktop_nav %}{% if not subitem %}
					{% if image_menu %}
						<div class="nav-dropdown-image d-none d-md-flex">
							{% set image_url = image_menu.image | static_url %}
							<img src="{{ 'images/empty-placeholder.png' | static_url }}" data-src="{{ image_url | settings_image_url('large') }}" class="lazyload" alt="{{ store.name }}">
							<div class="text-container">
								<div class="title">{{ image_menu.title }}</div>
								<div class="description">{{ image_menu.description }}</div>
								<a href="{{ image_menu.link | setting_url }}" class="button mt-auto" title="{{ store.name }}" aria-label="{{ store.name }}">VIEW ALL IN {{ image_menu.button }}</a>
							</div>
						</div>
					{% endif %}
			</div>{% endif %}{% endif %}
		</li>
	{% else %}
		<li class="{% if desktop_nav %}js-item-desktop nav-item-desktop {% if not subitem %}nav-main-item{% endif %}{% endif %} nav-item" data-component="menu.item">
			{% if item.name matches '/^destaque:cor:/' %}
				{% set parts = item.name|split(':') %}
				{% set color = parts[2] %}
				{% set text = parts[3]|upper %}
				
				<a  style="color: {{ color }}" class="nav-list-link {{ item.current ? 'selected' : '' }}" href="{% if item.url %}{{ item.url | setting_url }}{% else %}#{% endif %}">
					{{ text }}
				</a>
			{% else %}
        	  <a class="nav-list-link {{ item.current ? 'selected' : '' }}" href="{% if item.url %}{{ item.url | setting_url }}{% else %}#{% endif %}">{{ item.name }}</a>
			{% endif %}
        </li>
	{% endif %}
{% endfor %}
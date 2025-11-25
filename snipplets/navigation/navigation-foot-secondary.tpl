<ul class="footer-menu">
	{% for item in menus[settings.footer_menu_secondary] %}
		<li class="footer-menu-item">
			{% if item.name matches '/^destaque:cor:/' %}
				{% set parts = item.name|split(':') %}
				{% set color = parts[2] %}
				{% set text = parts[3]|upper %}
				
				<a style="color: {{ color }}" class="footer-menu-link" href="{% if item.url %}{{ item.url | setting_url }}{% else %}#{% endif %}">
					{{ text }}
				</a>
			{% else %}
	        	<a class="footer-menu-link" href="{{ item.url }}" {% if item.url | is_external %}target="_blank"{% endif %}>{{ item.name }}</a>
			{% endif %}
		</li>
	{% endfor %}
</ul>
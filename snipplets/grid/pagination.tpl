{% if infinite_scroll %}
	{% if pages.current == 1 and not pages.is_last %}
		<div class="js-load-more text-center my-4">
			<a class="btn btn-primary">
				{{ 'Mostrar más productos' | t }}
			</a>
		</div>
	{% endif %}
{% else %}
	<div class="d-flex justify-content-center align-items-center my-4">
		{% if pages.numbers %}
			<a {% if pages.previous %}href="{{ pages.previous }}"{% endif %} class="d-inline-block p-2 svg-icon-text {% if not pages.previous %}opacity-30 disabled{% endif %}">
				<svg class="icon-inline icon-2x icon-flip-horizontal"><use xlink:href="#arrow-long"/></svg>
			</a>
			<div class="d-inline-block mx-2 px-1 font-big">
				{% for page in pages.numbers %}
					{% if page.selected %}
						<span>{{ page.number }}</span>
					{% endif %}
				{% endfor %}
				<span>/</span>
				<span>{{ pages.amount }}</span>
			</div>
			<a {% if pages.next %}href="{{ pages.next }}"{% endif %} class="d-inline-block p-2 svg-icon-text {% if not pages.next %}opacity-30 disabled{% endif %}">
				<svg class="icon-inline icon-2x"><use xlink:href="#arrow-long"/></svg>
			</a>
		{% endif %}
	</div>
{% endif %}

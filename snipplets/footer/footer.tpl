{% set has_social_network = store.facebook or store.twitter or store.pinterest or store.instagram or store.tiktok or store.youtube %}
{% set has_footer_contact_info = (store.whatsapp or store.phone or store.email or store.address or store.blog) and settings.footer_contact_show %}
{% set has_footer_menu = settings.footer_menu and settings.footer_menu_show %}
{% set has_footer_menu_secondary = settings.footer_menu_secondary and settings.footer_menu_secondary_show %}
{% set has_footer_about = settings.footer_about_show and (settings.footer_about_title or settings.footer_about_description) %}
{% set has_payment_logos = settings.payments %}
{% set has_shipping_logos = settings.shipping %}
{% set has_shipping_payment_logos = has_payment_logos or has_shipping_logos %}
{% set has_seal_logos = store.afip or ebit or settings.custom_seal_code or ("seal_img.jpg" | has_custom_image) %}
{% set show_help = not has_products and not has_social_network %}

{% set use_defaults = not settings.disable_defaults_site and not settings.disable_defaults_footer %}

{# ADICIONADO overflow-x: hidden na tag footer para impedir qualquer rolagem lateral global no rodapé #}
<footer class="js-hide-footer-while-scrolling footer-block display-when-content-ready" data-store="footer" style="overflow-x: hidden;">
	<div class="container-fluid px-md-5">
		<div class="row element-footer">

			{% if template != 'password' %}

				{# =========================
				   SEÇÃO SOBRE (ABOUT)
				========================= #}
				{% if has_footer_about %}
					<div class="col-12 col-md-3 mb-4 footer-logo">
						{{ component('logos/logo', {logo_img_classes: 'transition-soft ' ~ logo_size_class, logo_text_classes: ''}) }}

						{% if settings.footer_about_title %}
							<h4 class="h3" style="max-width:320px;">{{ settings.footer_about_title }}</h4>
						{% endif %}
						{% if settings.footer_about_description %}
							<p style="max-width:320px;">{{ settings.footer_about_description }}</p>
						{% endif %}
					</div>
				{% else %}
					{% if use_defaults %}
						<div class="col-12 col-md-5 mb-4 footer-logo">
							{{ component('logos/logo', {logo_img_classes: 'transition-soft ' ~ logo_size_class, logo_text_classes: ''}) }}
							<h4 class="h3" style="max-width:320px;">Sobre a nossa empresa</h4>
							<p style="max-width:320px;">Descrição sobre a empresa.</p>
						</div>
					{% endif %}
				{% endif %}

				{# =========================
				   MENUS E NEWSLETTER
				========================= #}
				<div class="col">
					<div class="row">

						{# Menu principal #}
						{% if has_footer_menu %}
							<div class="col-12 col-md-3">
								<h4 class="h3">{{ settings.footer_menu_title | default('Menu') }}</h4>
								{% include "snipplets/navigation/navigation-foot.tpl" %}
							</div>
						{% else %}
							{% if use_defaults %}
							<div class="col-12 col-md-3">
								<h4 class="h3">Menu Principal</h4>
								<ul>
									<li><a href="#">1 Link</a></li>
									<li><a href="#">2 Link</a></li>
									<li><a href="#">3 Link</a></li>
								</ul>
							</div>
							{% endif %}
						{% endif %}

						{# Menu secundário #}
						{% if has_footer_menu_secondary %}
							<div class="col-12 col-md-3">
								<h4 class="h3">{{ settings.footer_menu_secondary_title | default('Links Secundários') }}</h4>
								{% include "snipplets/navigation/navigation-foot-secondary.tpl" %}
							</div>
						{% else %}
							{% if use_defaults %}
							<div class="col-12 col-md-3">
								<h4 class="h3">Menu Secundário</h4>
								<ul>
									<li><a href="#">1 Link</a></li>
									<li><a href="#">2 Link</a></li>
									<li><a href="#">3 Link</a></li>
								</ul>
							</div>
							{% endif %}
						{% endif %}

						{# Contato e Redes Sociais #}
						{% if has_footer_contact_info %}
 							<div class="col-12 col-md-3 element-footer">
								<h4 class="h3 mb-3">{{ settings.footer_contact_title | default('Informações de contato') }}</h4>
 								<div>{% include "snipplets/contact-links.tpl" %}</div>
							</div>

							<div class="col-12 col-md-3 {% if template == 'password' %} text-center{% endif %}">
								<div class="{% if template == 'password' %} text-center{% endif %}">
									<h4 class="h3 mb-3">{{ settings.footer_social_title | default('Redes sociais') }}</h4>
									{% include "snipplets/social/social-links.tpl" with {'circle': true} %}
								</div>
							</div>
						{% endif %}

					</div><!-- Fim row menus -->
				</div><!-- Fim col menus -->
			{% endif %}
		</div><!-- Fim row principal -->

		{# =========================
		   PAGAMENTO / ENVIO / SELOS
		========================= #}
		{% if template != 'password' %}
			{% if has_shipping_payment_logos or has_seal_logos %}
				<div class="divider mb-5"></div>

				{# CORREÇÃO IMPORTANTE: Removido px-3 px-md-5 desta ROW para evitar quebra lateral #}
				<div class="row element-footer justify-content-start">

					{% if has_shipping_payment_logos %}
						<div class="col-md-9" style="overflow-x: hidden;">
						  <div class="row m-0">

							{# ================= PAGAMENTOS ================= #}
							<div class="col-12 col-md-6 mb-4">
							  <div class="w-100">
								<h4 class="h3 mb-2">{{ "Medios de pago" | translate }}</h4>

								<div class="d-flex flex-wrap align-items-center gap-2">
								  {% if has_payment_logos %}
									{% include "snipplets/logos-icons.tpl" with {'payments': true} %}
								  {% else %}
									{% if use_defaults %}
									  <img src="https://placehold.co/200x40?text=Pagamentos"
										   class="img-fluid"
										   alt="Pagamentos" />
									{% endif %}
								  {% endif %}
								</div>
							  </div>
							</div>

							{# ================= ENVIOS ================= #}
							<div class="col-12 col-md-6 mb-4">
							  <div class="w-100">
								<h4 class="h3 mb-2">{{ "Medios de envío" | translate }}</h4>

								<div class="d-flex flex-wrap align-items-center gap-2">
								  {% if has_shipping_logos %}
									{% include "snipplets/logos-icons.tpl" with {'shipping': true} %}
								  {% else %}
									{% if use_defaults %}
									  <img src="https://placehold.co/200x40?text=Envios"
										   class="img-fluid"
										   alt="Envios" />
									{% endif %}
								  {% endif %}
								</div>
							  </div>
							</div>

						  </div>
						</div>
					{% endif %}

					{# =========================
					   SEÇÃO SELOS / PLACEHOLDERS
					========================= #}
					{% if has_seal_logos %}
						<div class="col-md-3">
							{% if store.afip %}
								<div class="footer-logo afip seal-afip">
									{{ store.afip | raw }}
								</div>
							{% endif %}

							{% if ebit %}
								<div class="footer-logo ebit seal-ebit">
									{{ ebit }}
								</div>
							{% endif %}

							{% if "seal_img.jpg" | has_custom_image or settings.custom_seal_code %}
								{% if "seal_img.jpg" | has_custom_image %}
									<div class="footer-logo custom-seal">
										{% if settings.seal_url != '' %}
											<a href="{{ settings.seal_url | setting_url }}" target="_blank">
										{% endif %}
											{% set seal_image = "seal_img.jpg" | static_url %}
											<img
												src="{{ 'images/empty-placeholder.png' | static_url }}"
												data-src="{{ seal_image | settings_image_url('large') }}"
												class="custom-seal-img lazyload"
												alt="{{ 'Sello de' | translate }} {{ store.name }}"
											/>
										{% if settings.seal_url != '' %}
											</a>
										{% endif %}
									</div>
								{% else %}
								{% if use_defaults %}
									<div class="footer-logo custom-seal text-center">
										{% if settings.seal_url != '' %}
											<a href="{{ settings.seal_url | setting_url }}" target="_blank">
										{% endif %}
											<img src="https://placehold.co/150x80?text=150x80+:+Selo" alt="{{ 'Sello de' | translate }} {{ store.name }}" class="custom-seal-img img-fluid" />
										{% if settings.seal_url != '' %}
											</a>
										{% endif %}
									</div>
								{% endif %}
								{% endif %}

								{% if settings.custom_seal_code %}
									<div class="footer-logo custom-seal custom-seal-code">
										{{ settings.custom_seal_code | raw }}
									</div>
								{% endif %}
							{% else %}
							{% if use_defaults %}
								<div class="footer-logo custom-seal text-center">
									<img src="https://placehold.co/150x80?text=150x80+:+Selo+Default" alt="{{ 'Sello de' | translate }} {{ store.name }}" class="custom-seal-img img-fluid" />
								</div>
							{% endif %}
							{% endif %}
						</div>
					{% else %}
					{% if use_defaults %}
						<div class="col-md-3 text-center">
							<img src="https://placehold.co/150x80?text=150x80+:+Selo+Placeholder" alt="{{ 'Sello de' | translate }} {{ store.name }}" class="custom-seal-img img-fluid" />
						</div>
						{% endif %}
					{% endif %}
				</div>
			{% endif %}
		{% endif %}
	</div>

	<div class="linear-footer"></div>

	{# =========================
	   COPYRIGHT E CRÉDITOS
	========================= #}
	<div class="js-footer-legal footer-legal pb-5">
		<div class="container-fluid px-md-5 pb-2">
			<div class="row">

				<div class="col-md-9 text-md-left mb-3 mb-md-0">
					<div class="d-inline-block mr-md-2" style="font-size: 9px; margin-left:10px; color: #ccc;">
						{{ "Copyright {1} - {2}. Todos los derechos reservados." | translate(
							(store.business_name ? store.business_name : store.name) ~ (store.business_id ? ' - ' ~ store.business_id : ''),
							"now" | date('Y')
						) }}
					</div>

					{{ component('claim-info', {
						container_classes: "d-md-inline-block mt-md-0 mt-3",
						divider_classes: "mx-1",
						text_classes: {text_consumer_defense: 'd-inline-block mb-1'},
						link_classes: {
							link_consumer_defense: "font-weight-bold",
							link_order_cancellation: "font-weight-bold",
						},
					}) }}

					<a href="https://www.tec4udigital.com" target="top" class="font-semibold" style="align-items: center; gap: 7px; font-size: 9px; margin-left:10px; color: #ccc;">
						Desenvolvido por
						<span>TEC4U Digital</span>
					</a>
				</div>

				<div class="col-md text-left text-md-right">
					{{ new_powered_by_link }}
				</div>
			</div>
		</div>
	</div>
</footer>

{% set newsletter_contact_error = contact.type == 'newsletter' and not contact.success %}
{% set has_newsletter = settings.news_show %}

{# --- Normaliza título e texto com fallback --- #}
{% set __news_title_raw = settings.news_title | default('') %}
{% set __news_title_test = __news_title_raw | striptags | trim %}
{% set newsletter_title = __news_title_test is not empty ? __news_title_raw : 'Receba novidades e promoções exclusivas' %}

{% set __news_text_raw = settings.news_text | default('') %}
{% set __news_text_test = __news_text_raw | striptags | trim %}
{% set newsletter_text = __news_text_test is not empty ? __news_text_raw : 'Assine nossa newsletter e fique por dentro das últimas ofertas e lançamentos da loja.' %}

{% set use_defaults = not settings.disable_defaults_site and not settings.disable_defaults_homepage %}

<section data-store="home-newsletter">
    <div class="section-newsletter-home js-home-newsletter" {% if not has_newsletter %}style="display:none;"{% endif %}>
        <div class="container-fluid">
            <div class="row justify-content-center">
                <div class="col-md-8 col-lg-6 text-center">
                    <div class="js-newsletter newsletter">

                        <h3 class="mb-4 font-body font-weight-normal text-uppercase">
                            {{ 'Newsletter' | translate }}
                        </h3>

                        <h2 class="h1 mb-4 js-home-newsletter-title">
                            {{ newsletter_title | raw }}
                        </h2>

                        <p class="js-home-newsletter-text">
                            {{ newsletter_text | raw }}
                        </p>

                        {% if contact and contact.type == 'newsletter' %}
                            {% if contact.success %}
                                <div class="alert alert-success">
                                    {{ "¡Gracias por suscribirte! A partir de ahora vas a recibir nuestras novedades en tu email" | translate }}
                                </div>
                            {% else %}
                            {% if use_defaults %}
                                <div class="alert alert-danger">
                                    {{ "Necesitamos tu email para enviarte nuestras novedades." | translate }}
                                </div>
                            {% endif %}
                            {% endif %}
                        {% endif %}

                        <form class="mt-5" method="post" action="/winnie-pooh" onsubmit="this.setAttribute('action', '');" data-store="newsletter-form">
                            <div class="input-append">

                                {% embed "snipplets/forms/form-input.tpl" with {
                                    input_for: 'email',
                                    type_email: true,
                                    input_name: 'email',
                                    input_id: 'email',
                                    input_placeholder: 'Digite seu email' | translate,
                                    input_custom_class: "form-control-big",
                                    input_aria_label: 'Email' | translate
                                } %}
                                {% endembed %}

                                <div class="winnie-pooh" style="display: none;">
                                    <label for="winnie-pooh-newsletter">
                                        {{ "Não preencher este campo" | translate }}
                                    </label>
                                    <input id="winnie-pooh-newsletter" type="text" name="winnie-pooh"/>
                                </div>

                                <input type="hidden" name="name" value="{{ "Sem nome" | translate }}" />
                                <input type="hidden" name="message" value="{{ "Inscrição em newsletter" | translate }}" />
                                <input type="hidden" name="type" value="newsletter" />

                                <input type="submit" name="contact" class="btn newsletter-btn" value="{{ " " | translate }}" />
                                <svg class="icon-inline newsletter-btn svg-icon-primary">
                                    <use xlink:href="#arrow"/>
                                </svg>
                            </div>
                        </form>

                        {# --- Fallback quando newsletter estiver desativada --- #}
                        {% if not has_newsletter %}
                        {% if use_defaults %}
                            <div class="mt-5 text-center">
                                <h4 class="font-weight-bold">Fique por dentro!</h4>
                                <p>Cadastre-se para receber novidades e ofertas exclusivas.</p>
                                <img
                                    src="https://placehold.co/300x150?text=Newsletter+Placeholder"
                                    alt="Newsletter"
                                    class="img-fluid mt-3"
                                />
                            </div>
                            {% endif %}
                        {% endif %}

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

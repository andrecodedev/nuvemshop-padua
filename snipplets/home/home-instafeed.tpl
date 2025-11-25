<section class="section-instafeed-home mt-5" data-store="home-instagram-feed">
    <div class="js-instagram-feed">
        <div class="container">
            <div class="row">
                {% set instuser = store.instagram|split('/')|last %}
                <div class="col-12 text-center">
                    <a target="_blank" href="{{ store.instagram }}" class="mb-0 d-flex" aria-label="{{ 'Instagram de' | translate }} {{ store.name }}">
                        <div class="instafeed-title{% if settings.theme_rounded %} svg-icon-primary{% else %} svg-icon-text{% endif %} mb-0">
                            <svg class="icon-inline h3 mt-md-1 mr-1"><use xlink:href="#instagram"/></svg>
                            <h2 class="h1-md instafeed-user{% if settings.theme_rounded %} text-primary{% endif %} mb-0">follow us</h2>
                        </div>

                        {# Instagram fallback info in case feed fails to load #}
                        <div class="js-ig-fallback d-flex" style="display: flex; align-items:center;margin-bottom: 6px;margin-left: 5px;">
                            <h5 class="font-weight-normal ml-2 mb-0">@{{ instuser }}</h5>
                        </div>
                    </a>
                </div>
            </div>
        </div>

        <div class="js-ig-success row no-gutters mt-3"
            data-ig-feed
            data-ig-items-count="6"
            data-ig-item-class="col-4 col-md-2"
            data-ig-link-class="instafeed-link"
            data-ig-image-class="instafeed-img w-100 fade-in"
            data-ig-aria-label="{{ 'Publicación de Instagram de' | translate }} {{ store.name }}"
            style="display: none;">
        </div>
    </div>
</section>
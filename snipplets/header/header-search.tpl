{# Search - aparece abaixo do header ao clicar no ícone de lupa #}
<div class="block-search">
    <div class="block-search-content">
        <form class="js-search-container js-search-form search-container" action="{{ store.search_url }}" method="get">
            <div class="form-group m-0">
                <input class="js-search-input form-control search-input" autocomplete="off" type="search" name="q" placeholder="{{ '¿Qué estás buscando?' | translate }}" aria-label="{{ '¿Qué estás buscando?' | translate }}" />
                <button type="submit" class="btn search-input-submit" value="{{ 'Buscar' | translate }}" aria-label="{{ 'Buscar' | translate }}">
                    <svg class="icon-inline icon-2x"><use xlink:href="#search"/></svg>
                </button>
                <button type="button" class="btn search-close js-search-close" aria-label="{{ 'Cerrar' | translate }}">
                    <svg class="icon-inline icon-2x"><use xlink:href="#times"/></svg>
                </button>
            </div>
        </form>
        <div class="js-search-suggest search-suggest">
            {# AJAX container for search suggestions #}
        </div>
    </div>
</div>

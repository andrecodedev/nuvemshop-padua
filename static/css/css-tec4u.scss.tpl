
header {
    .section-topbar {
        background-color: #000;
        color: #fff;
    }
    .nav-desktop {
        z-index: 2;
    }
    .header-content {
        background-color: #fff;

        *,
        .nav-desktop-list > .nav-item > .nav-list-link {
            color: #000;
            fill: #000;
        }
        .nav-desktop-list > .nav-item > .nav-list-link {
            position: relative;
            justify-content: center;

            &::after {
                content: "";
                height: 1px;
                background-color: currentColor;
                width: 0;
                flex-grow: 1;
                position: absolute;
                bottom: 5px;
                left: 0;
                transition: width 0.3s ease; // Adicionado para suavizar a transição
            }

            &:hover::after {
                width: 100%;
            }
        }

        .nav-item-desktop {
            {# max-width: 130px; #}
            width: 100%;
            text-align: center;
            flex-direction: column;
            display: flex;
        }
        #logo {
            filter: revert;

            @media (min-width: 991px) {
                min-width: 200px;
            }

            a {
                display: flex;
                margin: auto;
                justify-content: center;
                {# margin-left: 30px;
                margin-right: 30px; #}
            }

            @media (max-width: 767px) {
                margin-left: 0px;
                margin-right: 60px;
            }
        }
        ul.js-nav-desktop-list.nav-desktop-list {
            display: flex;
        }
        .nav-list-link {
            white-space: nowrap;
        }
        .desktop-dropdown {
            width: 100%;
            background-color: #fff;
            {# display: flex;
            justify-content: space-between; #}

            .nav-dropdown-image {
                width: 40%;
                max-height: 300px;
                padding: 24px;
                display: flex;

                img {
                    width: 50%;
                    height: auto;
                    object-fit: cover;
                }

                .text-container {
                    width: 50%;
                    background-color: #000;
                    padding: 16px 24px;
                    display: flex;
                    align-items: flex-start;
                    justify-content: flex-start;
                    flex-direction: column;

                    .title {
                        font-size: 16px;
                        font-style: normal;
                        font-weight: 700;
                        line-height: normal;
                        text-transform: uppercase;
                        margin-bottom: 8px;
                    }

                    .title,
                    .description,
                    .button {
                        color: #fff !important;
                        text-align: left;
                    }
                }
            }

            ul {
                background-color: #fff;
                display: flex;
                {# flex-direction: column; #}
                align-items: flex-start;
                justify-content: center;

                .nav-item-desktop.nav-item {
                    .nav-list-link {
                        color: #000 !important;
                        font-size: 13px;
                        text-align: left;
                        font-style: normal;
                        font-weight: 400;
                        line-height: normal;
                        text-transform: uppercase;
                        display: flex;
                        flex-wrap: nowrap;
                        gap: 8px;
                    }
                }
            }
        }

        .utilities-container {
            display: flex;
            align-items: center;
            justify-content: flex-end;
        }
    }

    .nav-accounts-item {
        a {
            color: #000 !important;
        }
    }
    .js-desktop-dropdown {
        padding: 0 20px;
    }
}

.js-item-product {
    .form-label {
        display: none !important;
    }
}

.js-product-variants,
.js-item-product {
    &.item {
        padding: 8px;
    }
    .js-product-variants.js-product-quickshop-variants.mb-3.form-row.mx-0.pt-2.row.px-2 {
        padding-left: 2px !important;
        padding-top: 0 !important;
    }

    .item-image,
    .item-image img {
        max-height: revert;
        width: 100%;
        height: 100%;
        object-fit: cover;
    }

    .item-buy {
        display: none;
        opacity: 0;
    }

    &:hover .item-buy {
        display: block;
        opacity: 1;
    }

    .form-label {
        font-size: 16px;
        text-transform: capitalize;

        &.-quantity-label {
            display: none;
        }
    }

    .btn-variant {
        color: #000;
        font-size: 12px;
        font-weight: 600;
        background: transparent;
        border: 1px solid #0000001f;
        border-radius: 0;
        padding: 10px 12px;

        &.selected {
            border: 1px solid #000;
            background-color: #000;
            color: #fff;
            border-radius: 50%;
        }
    }

    .-size,
    .-color {
        display: flex;
        align-items: center;
        justify-content: flex-start;
        gap: 5px;
        margin-bottom: 10px;

        .btn-variant {
            min-height: 30px;
            min-width: 35px;
            width: 35px;
            height: 30px;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 0;
            border: none;

            span {
                padding: 2px;
                display: flex;
                width: 100%;
                height: 100%;
                border-radius: 50%;
                border: 1px solid #0000001f;
                align-items: center;
                justify-content: center;
                border: none;
            }
        }
    }

    .item-colors {
        background-color: transparent;
        position: absolute;
        bottom: 0;
        z-index: 9;
        width: 100%;
        padding: 0 0 15px;
        right: 0;
        display: flex;
        align-content: center;
        justify-content: flex-end;

        span {
            border-radius: 50% !important;
            border: 1px solid #0000001f !important;
        }

        .js-insta-variant.btn-variant {
            border: 0;
            background-color: transparent;
            border-radius: 100%;
            padding: 0;
        }

        .item-colors-bullet {
            border: none !important;
            margin-right: 0 !important;

            .js-insta-variant {
                .item-colors-bullet {
                    width: 12px;
                    height: 12px;
                    min-width: 12px;
                }
            }
        }
    }

    .item-description {
        border-bottom: none;

        .item-link {
            .js-item-name {
                text-align: left;
            }
        }

        .item-price-container {
            display: flex;
            justify-content: flex-start;
            position: relative;
            width: fit-content;

            .item-price {
                text-align: left;
                color: var(--Black, #000);
                font-size: 14px;
                font-style: normal;
                font-weight: 400;
                line-height: normal;
            }
        }
    }
}

.title-section-products {
    background-color: #ece9e6;
    padding: 16px 0;

    h2 {
        color: var(--Black, #000);
        font-size: 20px;
        font-style: normal;
        font-weight: 500;
        line-height: normal;
        text-transform: uppercase;
        margin: 0;
        text-align: left;
    }
}
.js-swiper-featured-prev,
.js-swiper-featured-next {
    background: #ece9e6;
    padding: 10px;

    svg {
        width: 12px !important;
        height: 18px !important;
    }
}

.template-category,
.template-home {
    .head-fix {
        position: fixed;
    }

    header.js-head-main.head-main.head-primary.head-fix.transition-soft.logo-desktop-center {
        .header-content {
            background-color: transparent;

            * {
                color: #fff;
                fill: #fff;
            }

            #logo {
                filter: invert(1);
            }
        }
    }
    header.js-head-main.head-main.head-primary.head-fix.transition-soft.logo-desktop-center.compress {
        .header-content {
            background-color: #fff;

            * {
                color: #000;
                fill: #000;
            }
            #logo {
                filter: revert;
            }
        }
    }
}

.product-alerts {
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    right: -30%;
    z-index: 2;
    display: flex;
    flex-direction: column;
    gap: 6px;

    > span {
        white-space: wrap;
        padding: 2px 4px;
        color: #fff;
        width: auto;
        text-align: center;
        box-sizing: border-box;
        font-weight: 600;
        display: flex;
        align-items: center;
        font-size: 10px;
        background-color: #972B15;
    }
}
.item-image {
    .product-flags {
        position: absolute;
        top: 0;
        left: 0;
        z-index: 2;
        display: flex;
        flex-direction: column;
        gap: 6px;

        > span {
            white-space: wrap;
            padding: 4px 12px;
            color: #fff;
            height: 30px;
            width: auto;
            text-align: center;
            box-sizing: border-box;
            font-weight: 700;
            display: flex;
            align-items: center;
            font-size: 11px;
        }
    }
}

.template-home {
    .js-home-sections-container {
        .js-home-main-slider-container {
            .slider-slide {
                height: 0;
                position: relative;
                {# padding-bottom: 60.64%; #}
                width: 100%;

                img {
                    {# position: absolute; #}
                    top: 0;
                    left: 0;
                    width: 100%;
                    height: 100%;
                    object-fit: cover;
                }
            }
        }
    }

    .js-home-main-slider-container {
        .swiper-pagination {
            text-align: left;
            left: 64px;
            .swiper-pagination-bullet {
                width: 80px;
                height: 2px;
                background: rgba(255, 255, 255, 0.12);
                border-radius: 0;
                opacity: 1;
                &.swiper-pagination-bullet-active {
                    background: #fff;
                }
            }
        }
    }
    .section-banner_full-home {
        .banner_full-text {
            .title {
                color: #00b858;
            }
        }
    }
    .section-banner_full-home,
    .section-brands-home {
        background-color: transparent;
        overflow: hidden;

        .js-swiper-brands {
            overflow: visible;
        }
        .brand-image-container {
            padding-bottom: 76.22%;
        }

        .banner_full-image-container {
            padding-bottom: 38.11%;
        }

        .banner_full-image-container,
        .brand-image-container {
            position: relative;
            height: 0;

            img.banner_full-image,
            img.brand-image {
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                object-fit: cover;
                max-height: 100%;
                opacity: 1;
            }

            .banner_full-text,
            .brand-text {
                position: absolute;
                bottom: 16px;
                left: 16px;
                background-color: #000;
                color: #fff;
                margin: 16px;
                padding: 16px;
                max-width: 320px;
                display: flex;
                flex-direction: column;
                align-items: flex-start;
                justify-content: center;

                .title {
                    font-size: 20px;
                    font-style: normal;
                    font-weight: 700;
                    line-height: normal;
                    text-transform: uppercase;
                    margin-bottom: 10px;
                }

                .description {
                    font-size: 14px;
                    font-style: normal;
                    font-weight: 400;
                    line-height: normal;
                    text-align: left;
                }
            }
        }
    }

    .custom-banner-wrapper {
        background-color: #000;
        padding: 0;
        > .row {
            margin: 0 !important;

            .custom-banner-container {
                padding: 0 !important;
            }
        }
    }

    .custom-banner-content {
        display: flex;
        align-items: center;
    }

    .custom-banner-image {
        padding: 0 !important;

        .wrapper-image {
            padding-bottom: 75.61%;
            height: 0;
            position: relative;
            margin: 0;
            width: 100%;

            img {
                width: 100%;
                height: 100%;
                object-fit: cover;
                position: absolute;
                top: 0;
                left: 0;
            }
        }
    }

    .custom-banner-text {
        background-color: #000;
        color: #fff;
        padding: 50px;
        display: flex;
        justify-content: space-between;
        align-items: flex-start;
        text-align: left;
        flex-direction: column;

        .custom-banner-logo {
            width: 100%;
            margin-top: 10%;
            display: flex;
            justify-content: flex-end;

            img {
                width: 100px;
            }
        }

        .custom-banner-details {
            max-width: 400px;
        }

        .custom-banner-highlight {
            background-color: #fff;
            color: #000;
            font-size: 12px;
            text-transform: uppercase;
            padding: 5px 10px;
            display: inline-block;
            margin-bottom: 20px;
        }

        .custom-banner-title {
            font-size: 32px;
            font-weight: 700;
            text-transform: uppercase;
            margin-bottom: 15px;
        }

        .custom-banner-description {
            font-size: 16px;
            line-height: 1.5;
            margin-bottom: 20px;
        }

        .custom-banner-button {
            display: inline-block;
            background-color: transparent;
            border: 1px solid #fff;
            color: #fff;
            padding: 10px 20px;
            font-size: 14px;
            text-transform: uppercase;
            text-align: center;
            transition: all 0.3s ease;

            &:hover {
                background-color: #fff;
                color: #000;
            }
        }
    }
}
.template-search,
.template-category {
    .block-category-topo {
        background-color: #000;
        padding: 0;
        margin: 0;
        flex-direction: column-reverse;

        @media (min-width: 768px) {
            flex-direction: row;
        }
        > .-text {
            color: #fff;
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            justify-content: center;

            .title {
                color: #fff;
                font-size: 20px;
                font-style: normal;
                font-weight: 500;
                line-height: normal;
                text-transform: uppercase;
                margin: 12px 0 15px 0;
            }

            .description {
                font-size: 14px;
                font-style: normal;
                font-weight: 400;
                line-height: normal;
                text-align: left;
            }
        }

        > .-image {
            padding: 0;

            img {
                width: 100%;
                height: 100%;
                object-fit: cover;
            }
        }
    }
    .form-select-icon {
        right: revert;
        left: 15px;
    }

    .js-modal-open {
        .ml-2 {
            font-size: 12px;
        }
    }

    select.js-sort-by {
        border: none;
        padding: 10px 12px 14px 40px;
        text-transform: uppercase;
        font-size: 12px;

        option {
            text-transform: uppercase;
            font-weight: 500;
            font-size: 12px;
        }
    }

    .category-image-grid {
        padding: 8px;
        width: 100%;
        height: 100%;
        object-fit: cover;
    }

    .block-grid {
        h4 {
            font-size: 12px;
            font-style: normal;
            font-weight: 500;
            line-height: normal;
            text-transform: uppercase;
            margin: 0;
        }

        button {
            border: none;
            background-color: transparent;
            width: 100%;

            &.icon-grid-3 {
                svg {
                    width: 18px;
                    height: 16px;
                }
            }

            &.icon-grid-4 {
                svg {
                    width: 32px;
                    height: 16px;
                }
            }
        }
    }
    .block-banner {
        position: relative;
        height: 0;
        padding-bottom: 81.64% !important;

        @media (min-width: 768px) {
            &.grid-3 {
                padding-bottom: 52.82% !important;
            }
            &.grid-4 {
                padding-bottom: 40.82% !important;
            }
        }

        img {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
    }
}

.pagination {
    display: flex;
    justify-content: center;
    margin: 24px auto;
    gap: 8px;

    p {
        margin: 0;
        color: #00000099;
        font-weight: 500;
        line-height: 2;
        text-transform: uppercase;
    }

    strong {
        color: #000;
        line-height: 2;
    }
}

.template-product {
    .title-products {
        font-size: 16px;
    }
    .product-infos {
        height: fit-content;
        top: 85px;
        position: sticky;
        padding: 0 5%;

        @media (min-width: 991px) {
            padding: 0 4rem;
        }

        #compare_price_display {
            font-size: 15px;
        }

        .js-price-display {
            font-size: 16px;
            font-style: normal;
            font-weight: 500;
            line-height: normal;
            margin-right: 0.3rem;
        }
        .js-compare-price-display {
            opacity: 0.6;
        }

        .js-product-variants {
            &.item {
                padding: 8px;
            }
            .form-label {
                font-size: 12px;
                text-transform: uppercase;
                color: #000;
                opacity: 0.32;
                font-weight: 400;
                margin-bottom: 8px;

                &.-quantity-label {
                    display: none;
                }
            }

            .btn-variant {
                color: #000;
                font-size: 16px;
                font-weight: 600;
                background: transparent;
                border: 1px solid #ece9e6;
                border-radius: 0;
                padding: 6px 12px;

                &.selected {
                    border: 1px solid #ece9e6;
                    background-color: #ece9e6;
                    color: #000;
                }
            }
            .row.px-2 {
                padding: 0 !important;
            }
            .-size {
                padding: 0 !important;
                gap: 0;
                width: 100%;
                display: flex;
                align-items: stretch;

                .btn-variant {
                    width: 100%;
                    max-width: 100px;

                    > span {
                        border: none;
                    }
                }
            }
            .-color {
                margin-bottom: 10px;
                padding-left: 0;
                padding-right: 0;

                .btn-variant {
                    padding: 6px;
                    span {
                        width: 16px;
                        height: 16px;
                        border-radius: 100% !important;
                    }
                }
            }
        }
    }
    .product-description {
        .content-before-table {
            background: #ece9e6;
            padding: 16px;

            h2 {
                color: #00b858;
                font-size: 15px;
                font-style: normal;
                font-weight: 700;
                line-height: normal;
                text-transform: uppercase;
            }

            p {
                color: #000;
                font-size: 14px;
                font-style: normal;
                font-weight: 400;
                line-height: normal;
            }
        }
    }
    .collapse-title {
        font-weight: 400;
        text-transform: uppercase;
        cursor: pointer;
        padding: 16px 0;
        width: 100%;
        text-align: left;
        border: none;
        background: transparent;
        outline: none;
        color: #000;
        font-size: 14px;
        font-style: normal;
        line-height: normal;
        position: relative;

        &:hover {
            opacity: 0.9;
        }

        &::after {
            content: "";
            position: absolute;
            right: 0;
            top: 50%;
            width: 8px;
            height: 8px;
            border-left: 2px solid #000;
            border-bottom: 2px solid #000;
            transform: rotate(-45deg);
            transition: transform 0.3s ease;
        }
    }

    .collapse-title[aria-expanded="true"]::after {
        transform: rotate(135deg);
    }

    .collapse-content {
        max-height: 0;
        overflow: hidden;
        transition:
            max-height 0.3s ease,
            opacity 0.3s ease;
        padding: 0 10px;
        border-top: none;
        color: #000;
        opacity: 0.6;
    }

    .collapse-content.show {
        max-height: 500px;
    }
}

footer.footer-block {
    background-color: #000;

    * {
        color: #fff;
    }

    .footer-logo {
        p,
        h4.h3 {
            font-weight: 400;
            font-size: 11px;
            opacity: 0.5;
        }
        .logo-img-container {
            margin-left: 0;
        }
        img {
            {# filter: invert(1); #}
            max-width: 100%;
            max-height: 100%;
        }
    }

    .-newsletter {
        h4.h3 {
            margin-bottom: 0;
        }
        .input-append {
            position: relative;
            .form-group {
                input {
                    border-radius: 0;
                    border: 1px solid rgba(255, 255, 255, 0.12);
                    background: transparent;
                    color: #fff;
                    padding: 10px 15px;

                    &::placeholder {
                        color: #fff;
                    }
                }
            }
            svg,
            .newsletter-btn {
                position: absolute;
                top: 16px;
                right: 15px;
                width: 15px;
                height: 11px;
                text-indent: -99999px;
                &.btn {
                    z-index: 9;
                }
            }
        }
    }
}

.about-section {
    background: #ece9e6;
    margin-top: 80px;
    margin-bottom: 100px;

    > .container-fluid {
        padding: 0 5%;
    }
    .about-image {
        margin: -40px 0;
    }
}

.about-text {
    p {
        color: #000;
        font-size: 16px;
        font-style: normal;
        font-weight: 400;
        line-height: normal;
    }
}

.responsibility-section,
.about-section {
    figure {
        margin: 0;
        position: relative;
        padding-bottom: 115.18%;

        img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            position: absolute;
            top: 0;
            left: 0;
        }
    }
}

.mission-section {
    margin-bottom: 32px;
    padding: 0;

    @media (min-width: 768px) {
        padding: 0 5%;
    }

    figure {
        margin: 0;
        position: relative;
        padding-bottom: 106.67%;

        @media (min-width: 768px) {
            padding-bottom: 27.43%;
        }

        img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            position: absolute;
            top: 0;
            left: 0;
            border: 1px solid var(--Gray, #ece9e6);
        }

        @media (min-width: 768px) {
            padding-bottom: 27.43%;
            img {
                padding: 42px;
                border: 1px solid var(--Gray, #ece9e6);
            }
        }
    }
}

.values-section {
    padding: 0;
    margin-bottom: 32px;
    border: 1px solid #ece9e6;
    width: 90%;
}

.values-title {
    overflow: hidden;
    color: var(--Black, #000);
    text-align: center;
    text-overflow: ellipsis;
    font-size: 24px;
    font-style: normal;
    font-weight: 700;
    line-height: normal;
}

.values {
    padding: 70px 20px;
    margin: 42px;
    text-align: center;
    background: #ece9e6;
    width: calc(100% - 84px);
}

.card-block img {
    height: 60px;
    width: 60px;
    margin: 0 auto;
    object-fit: contain;
}

.responsibility-section {
    padding: 40px 20px;
}

.responsibility-section p {
    text-align: justify;
}

.signature {
    font-style: italic;
    text-align: right;
}

.press-section {
    .press-text {
        margin: 50px auto;

        .title {
            overflow: hidden;
            color: #000;
            text-align: center;
            text-overflow: ellipsis;
            font-size: 24px;
            font-style: normal;
            font-weight: 400;
            line-height: normal;
        }

        .description {
            color: #000;
            text-align: center;
            font-size: 18px;
            font-style: normal;
            font-weight: 400;
            line-height: normal;
            opacity: 0.6;
        }
    }

    .press-image-container {
        img {
            width: 100%;
        }
    }
}

.user-content {
    max-width: 800px;
    padding: 64px;
    background: var(--Gray, #ece9e6);
    margin: auto;

    > h2 {
        overflow: hidden;
        color: #000;
        text-align: left;
        text-overflow: ellipsis;
        font-size: 24px;
        font-style: normal;
        text-transform: uppercase;
        font-weight: 700;
        line-height: normal;
    }
}

.sidebar {
    position: fixed;
    left: 0;
    top: 0;
    width: 100%;
    max-width: 350px;
    height: 100%;
    background-color: #fff;
    transform: translateX(-100%);
    transition: transform 0.3s ease;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
    z-index: 1045;

    &.active {
        transform: translateX(0);
    }

    .sidebar-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin: 20px;
        padding-bottom: 8px;
        border-bottom: 1px solid #ece9e6;
    }

    .sidebar-title {
        font-size: 18px;
        font-weight: bold;
        color: #000;
    }

    .close-sidebar {
        background: none;
        border: none;
        cursor: pointer;
        svg {
            width: 24px;
            height: 24px;
        }
    }

    .sidebar-menu {
        padding: 20px;
        ul {
            list-style: none;
            padding: 0;

            li {
                a {
                    display: block;
                    padding: 10px 20px;
                    color: #000;
                    text-decoration: none;
                    text-transform: uppercase;
                    font-size: 16px;
                    border-left: 2px solid #ece9e6;

                    &:hover,
                    &.active {
                        border-left: 2px solid #000;
                        font-weight: 600;
                    }
                }
            }
        }
    }
}

#filters {
    border-radius: 0;
    width: 100%;

    .title-section {
        display: flex;
        align-items: center;
        background-color: #f8d8e4;
        text-align: center;
        color: #000;
        padding: 16px;
        border-radius: 0;
        font-weight: bold;
        font-size: 16px;
        justify-content: center;
    }

    .h6 {
        font-size: 14px;
        color: #333;
        margin: 0;
        text-transform: uppercase;
        cursor: pointer;
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding: 16px 0;
        border-radius: 0;
        background-color: #fff;
        border-bottom: 1px solid #d4d4d4;
        position: relative;
        font-weight: 500;

        &::after {
            content: "";
            width: 10px;
            height: 10px;
            border-right: 2px solid #333;
            border-bottom: 2px solid #333;
            transform: rotate(45deg);
            position: absolute;
            right: 15px;
            transition: transform 0.3s ease;
        }

        &.open::after {
            transform: rotate(-135deg);
        }
    }

    .filter-content {
        display: none;
        padding: 10px 0 0 0;
        flex-direction: column;

        .btn-link {
            color: #000;
            position: relative;
            display: flex;
            padding: 5px;
        }
        .checkbox-container {
            display: flex;
            align-items: center;
            margin-bottom: 10px;

            .checkbox {
                margin-right: 10px;
                display: flex;
                align-items: center;
                gap: 6px;

                .checkbox-icon {
                    width: 18px;
                    height: 18px;
                    border: 1px solid #ccc;
                    border-radius: 0;
                    display: inline-block;
                    position: relative;

                    &::after {
                        border-color: #fff;
                        top: 2px;
                        left: 6px;
                        width: 5px;
                        height: 10px;
                    }
                }
            }

            input[type="checkbox"]:checked + .checkbox .checkbox-icon {
                background-color: #000;
                border-color: #000;
            }

            .checkbox-text {
                font-size: 14px;
                color: #333;
            }
        }
    }

    .js-price-filter-container {
        .form-group {
            display: flex;
            flex-direction: row;
            align-items: flex-end;

            label {
                font-size: 14px;
                margin-bottom: 5px;
                color: #333;
            }

            .filter-input-price {
                border: 1px solid #ccc;
                border-radius: 0;
                padding: 8px;
                font-size: 14px;
            }

            .input-clear-content {
                color: #000;
                cursor: pointer;

                &:hover {
                    color: #363636;
                }
            }

            .btn {
                background-color: #000;
                color: #fff;
                border-radius: 0;
                padding: 18px;
                font-size: 0;
                cursor: pointer;
                margin: auto 0 0;

                &:hover {
                    background-color: #363636;
                }

                &::after {
                    content: "ok";
                    font-size: 8px;
                    padding: 0;
                    left: 50%;
                    position: absolute;
                    top: 50%;
                    transform: translate(-50%, -50%);
                }
                &.disabled {
                    color: #aaa;
                    cursor: not-allowed;
                }
            }
        }
    }
}

.toggle-sidebar {
    position: fixed;
    top: 120px;
    left: 64px;
    border: none;
    padding: 0;
    cursor: pointer;
    background-color: transparent;
}

@media (max-width: 768px) {
    .sidebar {
        width: 100%;
        transform: translateX(-100%);
    }
}

.whatsapp-float {
    position: fixed;
    bottom: 20px;
    right: 20px;
    width: 60px;
    height: 60px;
    z-index: 9999;
    border-radius: 50%;
    display: flex;
    justify-content: center;
    align-items: center;
    transition: transform 0.3s ease;
}

.whatsapp-float:hover {
    transform: scale(1.1);
}

.shipping-block {
    width: 100%;
    border-radius: 8px;
    border: 1px solid rgba(0, 0, 0, 0.12);
    display: flex;
    flex-direction: column;
    padding: 16px 12px;
    justify-content: space-between;
    align-items: center;
    align-self: stretch;

    margin-bottom: 20px;

    .collapse-button.btn {
        line-height: normal;
        width: 100%;

        p {
            text-transform: none;
            margin: 0;
            color: var(--Black, #000);
            font-size: 15px;
            font-style: normal;
            font-weight: 400;
            line-height: normal;
        }
    }

    .collapse-content-shipping {
        width: 100%;
        padding: 0 5px;

        .js-shipping-calculator-form {
            width: 100%;
            .form-control-container.col-7.pr-0 {
                border-radius: 4px;
                border: 1px solid rgba(95, 36, 159, 0.12);
                padding: 6px 6px 6px 16px;
                background: #fff;
                height: 40px;

                input.form-control.js-shipping-input {
                    border: none;
                    border-radius: 0;
                    padding: 0;
                    margin: 0;
                }
            }
            .js-calculate-shipping {
                background-color: rgba(0, 0, 0, 0.6);
                text-transform: uppercase;
                color: #fff;
                border-radius: 100%;
                width: 35px;
                border: none;
                height: 35px;
                padding: 0;
                font-size: 10px;
                margin-left: -40px;
                z-index: 1;
            }
        }
    }
}

.js-category-controls {
    .apply-filters {
        display: none;
    }
}

.apply-filters {
    display: flex;
    flex-direction: column;

    .js-remove-all-filters {
        overflow: hidden;
        color: var(--Black, #000);
        text-align: right;
        text-overflow: ellipsis;
        font-size: 10px;
        font-style: normal;
        font-weight: 400;
        line-height: normal;
        text-decoration-line: underline;
        text-transform: uppercase;
    }
}

.linear-footer {
    background: rgba(255, 255, 255, 0.12);
    height: 1px;
    width: calc(100% - 6rem);
    margin: 40px 3rem;
}

footer {
    .element-footer {
        .col {
            h4.h3 {
                font-size: 16px;
            }
        }
    }
    .footer-menu-item {
        margin-bottom: 8px;

        a {
            text-transform: uppercase;
            font-size: 12px;
        }
    }
}

.notification-cart {
    a {
        color: #fff !important;
    }
}

#nav-hamburger,
#nav-filters,
#modal-cart {
    background-color: #ffffff;
    padding: 10px 15px;

    .modal-header {
        border-bottom: 1px solid #ece9e6;
        padding: 16px 24px !important;
        margin: 0 0 12px 0 !important;
        border-radius: 0 !important;
        background: #fff !important;
        font-size: 16px !important;
        font-style: normal !important;
        font-weight: 700 !important;
        line-height: normal !important;
        text-transform: uppercase !important;
        width: 100%;
        color: #fff !important;

        span,
        a {
            color: #fff !important;
            fill: #fff !important;
        }

        &::before {
            content: "";
            display: inline-block;
            width: 18px;
            height: 21px;
            margin-right: 8px;
            vertical-align: middle;
        }

        .modal-close {
            color: #000 !important;
            fill: #000 !important;
        }
    }

    .js-cart-item {
        .cart-item-name {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            justify-content: flex-start;

            a {
                font-weight: 700;
            }
        }

        .cart-item-delete {
            display: flex;
            align-items: center;
            margin-left: auto;
            justify-content: flex-end;
            height: 100%;

            button {
                color: #b80000;
                font-size: 12px;
                text-transform: none;
                font-style: normal;
                font-weight: 400;
                width: fit-content;
                line-height: normal;
                position: relative;
            }
        }

        .cart-item-quantity {
            .form-quantity.cart-item-quantity {
                border: 1px solid var(--Gray, #ece9e6);
            }
        }
    }

    .variacao-name {
        color: var(--Black, #000);
        font-size: 12px;
        font-style: normal;
        font-weight: 400;
        line-height: normal;
        opacity: 0.6;
        text-transform: uppercase;
    }

    .image-cart {
        position: relative;
        height: 0;
        width: 100%;
        padding-bottom: 150%;
        display: flex;

        img {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            object-fit: cover;
            max-height: 100%;
            opacity: 1;
        }
    }
}

.js-modal-open-search {
    background-color: transparent;
    border: none;
}

.block-search {
    opacity: 0;
    top: -100%;
    position: absolute;
    width: 100%;
    left: 0;
    z-index: 1;
    transition:
        top 0.3s ease-in-out,
        opacity 0.3s ease-in-out;
    background-color: #fff;
    padding: 10px 20px;

    &.active {
        top: 100%;
        opacity: 1;
        transition:
            top 0.3s ease-in-out,
            opacity 0.3s ease-in-out;
    }

    input.form-control {
        background-color: #ebe9e6 !important;
    }
}

#modal-cart {
    .modal-header {
        &::before {
            background-repeat: no-repeat;
            background-image: url("data:image/svg+xml;utf8,<svg xmlns=%22http://www.w3.org/2000/svg%22 width=%2216%22 height=%2219%22 viewBox=%220 0 16 19%22 fill=%22none%22><path d=%22M5.75 4.6875V6.375H10.25V4.6875C10.25 3.45703 9.23047 2.4375 8 2.4375C6.73438 2.4375 5.75 3.45703 5.75 4.6875ZM4.0625 8.0625H1.8125V15.375C1.8125 16.3242 2.55078 17.0625 3.5 17.0625H12.5C13.4141 17.0625 14.1875 16.3242 14.1875 15.375V8.0625H11.9375V10.0312C11.9375 10.5234 11.5508 10.875 11.0938 10.875C10.6016 10.875 10.25 10.5234 10.25 10.0312V8.0625H5.75V10.0312C5.75 10.5234 5.36328 10.875 4.90625 10.875C4.41406 10.875 4.0625 10.5234 4.0625 10.0312V8.0625ZM4.0625 6.375V4.6875C4.0625 2.54297 5.82031 0.75 8 0.75C10.1445 0.75 11.9375 2.54297 11.9375 4.6875V6.375H14.1875C15.1016 6.375 15.875 7.14844 15.875 8.0625V15.375C15.875 17.2383 14.3633 18.75 12.5 18.75H3.5C1.63672 18.75 0.125 17.2383 0.125 15.375V8.0625C0.125 7.14844 0.863281 6.375 1.8125 6.375H4.0625Z%22 fill=%22black%22/></svg>");
        }
    }
}

#nav-filters {
    .modal-header {
        &::before {
            background-image: url("data:image/svg+xml;utf8,<svg xmlns=%22http://www.w3.org/2000/svg%22 width=%2220%22 height=%2219%22 viewBox=%220 0 20 19%22 fill=%22none%22><path d=%22M0 15.75C0 15.0859 0.546875 14.5 1.25 14.5H3.35938C3.86719 13.4062 4.96094 12.625 6.25 12.625C7.5 12.625 8.63281 13.4062 9.10156 14.5H18.75C19.4141 14.5 20 15.0859 20 15.75C20 16.4531 19.4141 17 18.75 17H9.10156C8.63281 18.1328 7.5 18.875 6.25 18.875C4.96094 18.875 3.86719 18.1328 3.35938 17H1.25C0.546875 17 0 16.4531 0 15.75ZM5 15.75C5 16.4531 5.54688 17 6.25 17C6.91406 17 7.5 16.4531 7.5 15.75C7.5 15.0859 6.91406 14.5 6.25 14.5C5.54688 14.5 5 15.0859 5 15.75ZM12.5 9.5C12.5 10.2031 13.0469 10.75 13.75 10.75C14.4141 10.75 15 10.2031 15 9.5C15 8.83594 14.4141 8.25 13.75 8.25C13.0469 8.25 12.5 8.83594 12.5 9.5ZM13.75 6.375C15 6.375 16.1328 7.15625 16.6016 8.25H18.75C19.4141 8.25 20 8.83594 20 9.5C20 10.2031 19.4141 10.75 18.75 10.75H16.6016C16.1328 11.8828 15 12.625 13.75 12.625C12.4609 12.625 11.3672 11.8828 10.8594 10.75H1.25C0.546875 10.75 0 10.2031 0 9.5C0 8.83594 0.546875 8.25 1.25 8.25H10.8594C11.3672 7.15625 12.4609 6.375 13.75 6.375ZM7.5 4.5C8.16406 4.5 8.75 3.95312 8.75 3.25C8.75 2.58594 8.16406 2 7.5 2C6.79688 2 6.25 2.58594 6.25 3.25C6.25 3.95312 6.79688 4.5 7.5 4.5ZM10.3516 2H18.75C19.4141 2 20 2.58594 20 3.25C20 3.95312 19.4141 4.5 18.75 4.5H10.3516C9.88281 5.63281 8.75 6.375 7.5 6.375C6.21094 6.375 5.11719 5.63281 4.60938 4.5H1.25C0.546875 4.5 0 3.95312 0 3.25C0 2.58594 0.546875 2 1.25 2H4.60938C5.11719 0.90625 6.21094 0.125 7.5 0.125C8.75 0.125 9.88281 0.90625 10.3516 2Z%22 fill=%22black%22/></svg>");
            background-repeat: no-repeat;
        }
    }

    .js-modal-close {
        color: #000 !important;
        text-transform: uppercase !important;
    }
    #filters {
        > .mb-5 {
            border-bottom: 1px solid var(--Gray, #ece9e6);
        }

        .mb-5 > div.mb-3.mt-4.h5,
        .js-price-filter-container form .mb-3.mt-4.h5 {
            color: #000;
            text-transform: uppercase;
            font-weight: 400;
        }
        .js-price-filter-btn {
            background-color: #000;
            margin-top: 0;
            width: 100%;
            color: #fff;
            position: relative;
        }
    }
}

#home-modal {
    border-radius: 0;
    background-color: transparent !important;
    overflow: hidden;
    padding: 0;

    @media screen and (min-width: 768px) {
        width: 50% !important;
    }
    .modal-close.invert {
        border: 0;
        fill: #000;
        top: 60px;
    }
    .modal-body {
        display: flex;
        align-items: center;
        background-color: #fff;
        color: #000;
        @media screen and (max-width: 768px) {
            flex-direction: row !important;
        }

        img {
            width: 48%;
        }

        .row.align-items-center {
            padding: 25px;

            .newsletter .form-control {
                border-radius: 0;
                border: 1px solid #ccc;
            }

            .form-group {
                margin-bottom: 0;
            }

            h3 {
                text-transform: uppercase;
                font-weight: 600;
                margin-bottom: 20px;
                text-align: left;
            }

            .input-append {
                display: flex;
                align-items: center;
                justify-content: center;
                border-radius: 0;
                gap: 20px;
                margin-bottom: 20px;
            }
            .js-news-popup-submit {
                margin: auto;
                display: flex;
                width: 180px;
                background: #000;
                color: #fff;
                position: relative;
                height: 54px;
                top: revert;
                right: revert;

                &::placeholder {
                    color: #fff;
                    font-weight: 400;
                    text-transform: uppercase;
                }
                span.js-news-send {
                    color: #fff;
                    position: absolute;
                    right: 20px;
                    z-index: 50;
                }
            }
            .infos-newsletter {
                color: #a1a1a1;
                font-size: 8px;
                margin-top: 15px;
                text-align: left;
            }
        }
        .js-news-popup-failed,
        .js-news-popup-success {
            color: #000;
        }
    }
}

.font-arial {
    font-family: Arial, Helvetica, sans-serif !important;
}

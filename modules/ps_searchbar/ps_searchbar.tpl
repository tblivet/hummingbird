{**
 * 2007-2020 PrestaShop SA and Contributors
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to https://www.prestashop.com for more information.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2020 PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}

<div id="_desktop_ps_searchbar" class="order-2 ms-auto col-auto d-none d-md-flex align-items-center">
  <div id="ps_searchbar" class="ps-searchbar js-search-widget" data-search-controller-url="{$search_controller_url}">
    <form class="ps-searchbar__form" method="get" action="{$search_controller_url}">
      <input type="hidden" name="controller" value="search">
      <i class="material-icons ps-searchbar__magnifier js-search-icon" aria-hidden="true">search</i>
      <i class="material-icons ps-searchbar__clear js-search-clear d-none" aria-hidden="true">clear</i>
      <input class="js-search-input form-control ps-searchbar__input" type="text" name="s" value="{$search_string}" placeholder="{l s='Search our catalog' d='Shop.Theme.Catalog'}" aria-label="{l s='Search' d='Shop.Theme.Catalog'}">
    </form>

    <div class="ps-searchbar__dropdown js-search-dropdown d-none">
      <ul class="ps-searchbar__results js-search-results"></ul>
    </div>
  </div>
</div>

<template id="ps_searchbar_result" class="js-search-template">
  <li class="ps-searchbar__result">
    <a class="ps-searchbar__result-link" href="">
      <img src="" alt="" class="ps-searchbar__result-image">
      <p class="ps-searchbar__result-name"></p>
    </a>
  </li>
</template>

{* MOBILE SEARCH BAR *}
<div class="ps-searchbar--mobile d-md-none d-flex col-auto">
  <div class="header-block d-flex align-items-center">
    <a class="header-block__action-btn" href="#" role="button" data-bs-toggle="offcanvas" data-bs-target="#searchCanvas" aria-controls="searchCanvas" aria-label="{l s='Show search bar' d='Shop.Theme.Global'}">
      <span class="material-icons header-block__icon">search</span>
    </a>
  </div>

  <div class="ps-searchbar__offcanvas js-search-offcanvas offcanvas offcanvas-top h-auto" tabindex="-1" id="searchCanvas" aria-labelledby="offcanvasTopLabel">
    <div class="offcanvas-header">
      <div id="_mobile_ps_searchbar" class="ps-searchbar__container"></div>
      <button type="button" class="btn btn-link" data-bs-dismiss="offcanvas" aria-label="Close">{l s='Cancel' d='Shop.Theme.Global'}</button>
    </div>
  </div>
</div>

{**
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *}

 <div class="ps-contactinfo footer__block block-contact col-md-6 col-lg-3">
  <p class="footer__block__title d-none d-md-flex">{l s='Store information' d='Shop.Theme.Global'}</p>

  <div role="button" class="footer__block__toggle d-md-none collapsed" data-bs-target="#contact-infos" data-bs-toggle="collapse" aria-expanded="false">
    <span class="footer__block__title">{l s='Store information' d='Shop.Theme.Global'}</span>
    <i class="material-icons" aria-hidden="true">keyboard_arrow_down</i>
  </div>

  <div id="contact-infos" class="footer__block__content footer__block__content-contact collapse">

    <div class="ps-contactinfo__infos">
      {$contact_infos.address.formatted nofilter}
    </div>

    {if $contact_infos.phone}
      <div class="ps-contactinfo__phone">
        <i class="material-icons" aria-hidden="true">phone</i>
        <a href="tel:{$contact_infos.phone|escape:'htmlall':'UTF-8'}">{$contact_infos.phone|escape:'htmlall':'UTF-8'}</a>
      </div>
    {/if}

    {if $contact_infos.fax}
      <div class="ps-contactinfo__fax">
        <i class="material-icons" aria-hidden="true">&#xE8AD;</i>
        <a href="fax:{$contact_infos.fax|escape:'htmlall':'UTF-8'}">{$contact_infos.fax|escape:'htmlall':'UTF-8'}</a>
      </div>
    {/if}

    {if $contact_infos.email && $display_email}
      <div class="ps-contactinfo__email">
        <i class="material-icons" aria-hidden="true">mail</i>
        {mailto address=$contact_infos.email encode="javascript"}
      </div>
    {/if}

  </div>
</div>

{**
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *}
{if {env key="VITE_ENV"} == "development"}
  {foreach $stylesheets.external as $css}
    {if isset($css.id) && $css.id != 'theme-main'}
      <link rel="stylesheet" href="{$css.uri}" type="text/css" media="{$css.media}">
    {/if}
  {/foreach}
{else}
  {foreach $stylesheets.external as $css}
    <link rel="stylesheet" href="{$css.uri}" type="text/css" media="{$css.media}">
  {/foreach}
{/if}

{foreach $stylesheets.inline as $stylesheet}
  <style>
    {$stylesheet.content}
  </style>
{/foreach}

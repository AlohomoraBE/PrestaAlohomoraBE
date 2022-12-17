{*
* 2021 Anvanto
*
* NOTICE OF LICENSE
*
* This file is not open source! Each license that you purchased is only available for 1 wesite only.
* If you want to use this file on more websites (or projects), you need to purchase additional licenses.
* You are not allowed to redistribute, resell, lease, license, sub-license or offer our resources to any third party.
*
*  @author Anvanto <anvantoco@gmail.com>
*  @copyright  2021 Anvanto
*  @license    Valid for 1 website (or project) for each purchase of license
*  International Registered Trademark & Property of Anvanto
*}
{$image_limit = Module::getInstanceByName('an_theme')->getParam('segmentedviewsettinds_imagelimit')}
{assign currency_code Context::getContext()->currency->iso_code}
{block name='product_miniature_item'}
<article class="product-miniature js-product-miniature
{if Module::isEnabled('an_theme') and  Module::getInstanceByName('an_theme')->getParam('product_productImageChange') == 'hover-slider'}
product-miniature-hover-slider
{/if}
{if Module::isEnabled('an_theme')}
js-img-view-type
type-{Module::getInstanceByName('an_theme')->getParam('product_productImageChange')}
{/if}
{if isset($page) and ($page.page_name == 'category' or $page.page_name == 'new-products' or $page.page_name == 'prices-drop' or $page.page_name == 'best-sales' or $page.page_name == 'search' or $page.page_name == 'manufacturer')}
    {if isset($smarty.cookies.an_collection_view)}
      col-lg-{$smarty.cookies.an_collection_view}
    {else}
      {Module::getInstanceByName('an_theme')->getParam('categoryPage_productsAmount')}
    {/if}
  {/if}
{if Module::isEnabled('an_theme') and  Module::getInstanceByName('an_theme')->getParam('product_productMobileRow')}
product-mobile-row
{/if}
 {if Module::isEnabled('an_theme') and  Module::getInstanceByName('an_theme')->getParam('product_productHeight')}
      product-height
      {/if}
" data-id-product="{$product.id_product}" data-id-product-attribute="{$product.id_product_attribute}" itemscope itemtype="http://schema.org/Product">
    {if isset($product->upc) AND $product->upc}
    <meta itemprop="gtin13" content="{l s='EAN Code:'}{$product->ean13}">
    {/if}
    {if isset($product->isbn) AND $product->isbn}
    <meta itemprop="gtin13" content="{l s='ISBN Code:'}{$product->isbn}">
    {/if}
    {if isset($product->upc) AND $product->upc}
    <meta itemprop="gtin13" content="{l s='UPC Code:'}{$product->upc}">
    {/if}
    {if isset($product.cover.large.url) AND $product.cover.large.url}
    <meta itemprop="image" content="{$product.cover.large.url}">
    {/if}
    {if isset($product.id_manufacturer) AND $product.id_manufacturer}
    <div itemprop="brand" itemtype="https://schema.org/Brand" itemscope>
    <meta itemprop="name" content="{Manufacturer::getnamebyid($product.id_manufacturer)}">
    </div>
    {/if}
    {if isset($product.description_short) AND $product.description_short}
    <meta itemprop="description" content="{$product.description_short|strip_tags:'UTF-8'}">
    {/if}
    <meta itemprop="sku" content="{$product.id_product}">

    <div class="thumbnail-container">

        <div class="thumbnail-container-image" style="min-height: {if isset($page) and ($page.page_name == 'category' or $page.page_name == 'new-products' or $page.page_name == 'prices-drop' or $page.page_name == 'best-sales' or $page.page_name == 'search' or $page.page_name == 'manufacturer')}{if isset($smarty.cookies.an_collection_view)|strip}{if $smarty.cookies.an_collection_view == 3}{$product.cover.bySize.catalog_small.height|strip}{elseif $smarty.cookies.an_collection_view == 4}{$product.cover.bySize.home_default.height|strip}{elseif $smarty.cookies.an_collection_view == 6}{$product.cover.bySize.catalog_large.height|strip}{else}{$product.cover.bySize.home_default.height|strip}{/if}{else}{if Module::getInstanceByName('an_theme')->getParam('categoryPage_productsAmount') == 3}{$product.cover.bySize.catalog_small.height|strip}{elseif Module::getInstanceByName('an_theme')->getParam('categoryPage_productsAmount') == 4}{$product.cover.bySize.home_default.height|strip}{elseif Module::getInstanceByName('an_theme')->getParam('categoryPage_productsAmount') == 6}{$product.cover.bySize.catalog_large.height|strip}{else}{$product.cover.bySize.home_default.height|strip}{/if}{/if}{else}{$product.cover.bySize.home_default.height|strip}{/if}px;">
                    {block name='product_thumbnail'}

        {if !$product.cover}
        		<a href="{$product.url}" class="thumbnail product-thumbnail"
        		style="height: {if isset($page) and $page.page_name == 'category'}{if isset($smarty.cookies.an_collection_view)|strip}{if $smarty.cookies.an_collection_view == 3}{$urls.no_picture_image.bySize.catalog_small.height|strip}{elseif $smarty.cookies.an_collection_view == 4}{$urls.no_picture_image.bySize.home_default.height|strip}{elseif $smarty.cookies.an_collection_view == 6}{$urls.no_picture_image.bySize.catalog_large.height|strip}{else}{$urls.no_picture_image.bySize.home_default.height|strip}{/if}{else}{if Module::getInstanceByName('an_theme')->getParam('categoryPage_productsAmount') == 3}{$urls.no_picture_image.bySize.catalog_small.height|strip}{elseif Module::getInstanceByName('an_theme')->getParam('categoryPage_productsAmount') == 4}{$urls.no_picture_image.bySize.home_default.height|strip}{elseif Module::getInstanceByName('an_theme')->getParam('categoryPage_productsAmount') == 6}{$urls.no_picture_image.bySize.catalog_large.height|strip}{else}{$urls.no_picture_image.bySize.home_default.height|strip}{/if}{/if}{else}{$urls.no_picture_image.bySize.home_default.height|strip}{/if}px;">
                    <img
                      src="
                      {if isset($page) and $page.page_name == 'category'}
                         {if isset($smarty.cookies.an_collection_view)}
                                 {if $smarty.cookies.an_collection_view == 3}
                                         {$urls.no_picture_image.bySize.catalog_small.url}
                                 {elseif $smarty.cookies.an_collection_view == 4}
                                         {$urls.no_picture_image.bySize.home_default.url}
                                 {elseif $smarty.cookies.an_collection_view == 6}
                                         {$urls.no_picture_image.bySize.catalog_large.url}
                                 {else}
                                         {$urls.no_picture_image.bySize.home_default.url}
                                 {/if}
                         {else}
                                     {if Module::getInstanceByName('an_theme')->getParam('categoryPage_productsAmount') == 3}
                                         {$urls.no_picture_image.bySize.catalog_small.url}
                                 {elseif Module::getInstanceByName('an_theme')->getParam('categoryPage_productsAmount') == 4}
                                         {$urls.no_picture_image.bySize.home_default.url}
                                 {elseif Module::getInstanceByName('an_theme')->getParam('categoryPage_productsAmount') == 6}
                                         {$urls.no_picture_image.bySize.catalog_large.url}
                                 {else}
                                         {$urls.no_picture_image.bySize.home_default.url}
                                 {/if}
                         {/if}
                      {else}
                        {$urls.no_picture_image.bySize.home_default.url}
                      {/if}
                      "
                      data-catalog-small="{$urls.no_picture_image.bySize.catalog_small.url}"
                      data-catalog-medium="{$urls.no_picture_image.bySize.home_default.url}"
                      data-catalog-large="{$urls.no_picture_image.bySize.catalog_large.url}"
                      data-width="{$urls.no_picture_image.bySize.home_default.width}"
                      data-height="{$urls.no_picture_image.bySize.home_default.height}"
                    >
                  </a>


                {else}
        {if Module::isEnabled('an_theme')}
          {if Module::getInstanceByName('an_theme')->getParam('product_productImageChange') == 'standart'}
         <a href="{$product.url}" class="thumbnail product-thumbnail"
         	        style="height: {if isset($page) and ($page.page_name == 'category' or $page.page_name == 'new-products' or $page.page_name == 'prices-drop' or $page.page_name == 'best-sales' or $page.page_name == 'search' or $page.page_name == 'manufacturer')}{if isset($smarty.cookies.an_collection_view)|strip}{if $smarty.cookies.an_collection_view == 3}{$product.cover.bySize.catalog_small.height|strip}{elseif $smarty.cookies.an_collection_view == 4}{$product.cover.bySize.home_default.height|strip}{elseif $smarty.cookies.an_collection_view == 6}{$product.cover.bySize.catalog_large.height|strip}{else}{$product.cover.bySize.home_default.height|strip}{/if}{else}{if Module::getInstanceByName('an_theme')->getParam('categoryPage_productsAmount') == 3}{$product.cover.bySize.catalog_small.height|strip}{elseif Module::getInstanceByName('an_theme')->getParam('categoryPage_productsAmount') == 4}{$product.cover.bySize.home_default.height|strip}{elseif Module::getInstanceByName('an_theme')->getParam('categoryPage_productsAmount') == 6}{$product.cover.bySize.catalog_large.height|strip}{else}{$product.cover.bySize.home_default.height|strip}{/if}{/if}{else}{$product.cover.bySize.home_default.height|strip}{/if}px;">
         						<img
         							src="{if Module::getInstanceByName('an_theme')->getParam('product_lazyLoad')}
         							 {$urls.base_url}/modules/an_theme/views/img/loading.svg
         							 {else}
         							    {if isset($page) and ($page.page_name == 'category' or $page.page_name == 'new-products' or $page.page_name == 'prices-drop' or $page.page_name == 'best-sales' or $page.page_name == 'search' or $page.page_name == 'manufacturer')}
                             {if isset($smarty.cookies.an_collection_view)}
                                 {if $smarty.cookies.an_collection_view == 3}
                                     {$product.cover.bySize.catalog_small.url}
                                 {elseif $smarty.cookies.an_collection_view == 4}
                                     {$product.cover.bySize.home_default.url}
                                 {elseif $smarty.cookies.an_collection_view == 6}
                                     {$product.cover.bySize.catalog_large.url}
                                 {else}
                                     {$product.cover.bySize.home_default.url}
                                 {/if}
                             {else}
                                   {if Module::getInstanceByName('an_theme')->getParam('categoryPage_productsAmount') == 3}
                                     {$product.cover.bySize.catalog_small.url}
                                 {elseif Module::getInstanceByName('an_theme')->getParam('categoryPage_productsAmount') == 4}
                                     {$product.cover.bySize.home_default.url}
                                 {elseif Module::getInstanceByName('an_theme')->getParam('categoryPage_productsAmount') == 6}
                                     {$product.cover.bySize.catalog_large.url}
                                 {else}
                                     {$product.cover.bySize.home_default.url}
                                 {/if}
                             {/if}
                         {else}
                             {$product.cover.bySize.home_default.url}
                         {/if}
         							 {/if}"
                        {if Module::getInstanceByName('an_theme')->getParam('product_lazyLoad')}
                        data-lazy-gif="{$urls.base_url}/modules/an_theme/views/img/loading.svg"
                        {/if}
         							data-catalog-small="{$product.cover.bySize.catalog_small.url}"
         							data-catalog-medium="{$product.cover.bySize.home_default.url}"
         							data-catalog-large="{$product.cover.bySize.catalog_large.url}"
         							alt="{if !empty($product.cover.legend)}{$product.cover.legend}{else}{$product.name|truncate:30:'...'}{/if}"
         							data-full-size-image-url="{$product.cover.large.url}"
         							class="{if Module::getInstanceByName('an_theme')->getParam('product_lazyLoad')} b-lazy {/if}"
         							data-width="{$product.cover.bySize.home_default.width}"
         							data-height="{$product.cover.bySize.home_default.height}"
         							content="{$product.cover.bySize.home_default.url}"
                       data-src="{if isset($page) and ($page.page_name == 'category' or $page.page_name == 'new-products' or $page.page_name == 'prices-drop' or $page.page_name == 'best-sales' or $page.page_name == 'search' or $page.page_name == 'manufacturer')}
                             {if isset($smarty.cookies.an_collection_view)}
                                 {if $smarty.cookies.an_collection_view == 3}
                                     {$product.cover.bySize.catalog_small.url}
                                 {elseif $smarty.cookies.an_collection_view == 4}
                                     {$product.cover.bySize.home_default.url}
                                 {elseif $smarty.cookies.an_collection_view == 6}
                                     {$product.cover.bySize.catalog_large.url}
                                 {else}
                                     {$product.cover.bySize.home_default.url}
                                 {/if}
                             {else}
                                 {if Module::getInstanceByName('an_theme')->getParam('categoryPage_productsAmount') == 3}
                                     {$product.cover.bySize.catalog_small.url}
                                 {elseif Module::getInstanceByName('an_theme')->getParam('categoryPage_productsAmount') == 4}
                                     {$product.cover.bySize.home_default.url}
                                 {elseif Module::getInstanceByName('an_theme')->getParam('categoryPage_productsAmount') == 6}
                                     {$product.cover.bySize.catalog_large.url}
                                 {else}
                                     {$product.cover.bySize.home_default.url}
                                 {/if}
                             {/if}
                         {else}
                             {$product.cover.bySize.home_default.url}
                         {/if}"
         						>
         		    </a>
          {elseif Module::getInstanceByName('an_theme')->getParam('product_productImageChange') == 'hover'}
                     
            <a href="{$product.url}" class="thumbnail product-thumbnail"
                      style="height: {if isset($page) and ($page.page_name == 'category' or $page.page_name == 'new-products' or $page.page_name == 'prices-drop' or $page.page_name == 'best-sales' or $page.page_name == 'search' or $page.page_name == 'manufacturer')}{if isset($smarty.cookies.an_collection_view)|strip}{if $smarty.cookies.an_collection_view == 3}{$product.cover.bySize.catalog_small.height|strip}{elseif $smarty.cookies.an_collection_view == 4}{$product.cover.bySize.home_default.height|strip}{elseif $smarty.cookies.an_collection_view == 6}{$product.cover.bySize.catalog_large.height|strip}{else}{$product.cover.bySize.home_default.height|strip}{/if}{else}{if Module::getInstanceByName('an_theme')->getParam('categoryPage_productsAmount') == 3}{$product.cover.bySize.catalog_small.height|strip}{elseif Module::getInstanceByName('an_theme')->getParam('categoryPage_productsAmount') == 4}{$product.cover.bySize.home_default.height|strip}{elseif Module::getInstanceByName('an_theme')->getParam('categoryPage_productsAmount') == 6}{$product.cover.bySize.catalog_large.height|strip}{else}{$product.cover.bySize.home_default.height|strip}{/if}{/if}{else}{$product.cover.bySize.home_default.height|strip}{/if}px;">
                      {assign "imgcount" "1"}
                       {foreach from=$product.images item=image name=foo}
                       {if ($image.id_image == $product.cover.id_image) or $imgcount}
                         {if ($image.id_image == $product.cover.id_image)}{$imgcount=$imgcount+1}{/if}
                         {$imgcount=$imgcount-1}
                          <img
                              class="{if Module::getInstanceByName('an_theme')->getParam('product_lazyLoad')} b-lazy {/if} img_hover_change {if $image.id_image == $product.cover.id_image} cover {/if} {if $smarty.foreach.foo.total == 1 } only_one {/if}"
                              data-full-size-image-url="{$image.bySize.large_default.url}"
                              src="{if Module::getInstanceByName('an_theme')->getParam('product_lazyLoad')}
                              {$urls.base_url}/modules/an_theme/views/img/loading.svg
                              {else}
                              {if isset($page) and ($page.page_name == 'category' or $page.page_name == 'new-products' or $page.page_name == 'prices-drop' or $page.page_name == 'best-sales' or $page.page_name == 'search' or $page.page_name == 'manufacturer')}
                                  {if isset($smarty.cookies.an_collection_view)}
                                      {if $smarty.cookies.an_collection_view == 3}
                                          {$image.bySize.catalog_small.url}
                                      {elseif $smarty.cookies.an_collection_view == 4}
                                          {$image.bySize.home_default.url}
                                      {elseif $smarty.cookies.an_collection_view == 6}
                                          {$image.bySize.catalog_large.url}
                                      {else}
                                          {$image.bySize.home_default.url}
                                      {/if}
                                  {else}
                                      {if Module::getInstanceByName('an_theme')->getParam('categoryPage_productsAmount') == 3}
                                          {$image.bySize.catalog_small.url}
                                      {elseif Module::getInstanceByName('an_theme')->getParam('categoryPage_productsAmount') == 4}
                                          {$image.bySize.home_default.url}
                                      {elseif Module::getInstanceByName('an_theme')->getParam('categoryPage_productsAmount') == 6}
                                          {$image.bySize.catalog_large.url}
                                      {else}
                                          {$image.bySize.home_default.url}
                                      {/if}
                                  {/if}
                              {else}
                                  {$image.bySize.home_default.url}
                              {/if}
                          {/if}"
                          {if Module::getInstanceByName('an_theme')->getParam('product_lazyLoad')}
                          data-lazy-gif="{$urls.base_url}/modules/an_theme/views/img/loading.svg"
                          {/if}
                          data-catalog-small="{$image.bySize.catalog_small.url}"
                          data-catalog-medium="{$image.bySize.home_default.url}"
                          data-catalog-large="{$image.bySize.catalog_large.url}"
                          alt="{$image.legend}"
                          data-width="{$image.bySize.home_default.width}"
                          data-height="{$image.bySize.home_default.height}"
                          content="{$image.bySize.home_default.url}"
                          data-src="{if isset($page) and ($page.page_name == 'category' or $page.page_name == 'new-products' or $page.page_name == 'prices-drop' or $page.page_name == 'best-sales' or $page.page_name == 'search' or $page.page_name == 'manufacturer')}
                              {if isset($smarty.cookies.an_collection_view)}
                                  {if $smarty.cookies.an_collection_view == 3}
                                      {$image.bySize.catalog_small.url}
                                  {elseif $smarty.cookies.an_collection_view == 4}
                                      {$image.bySize.home_default.url}
                                  {elseif $smarty.cookies.an_collection_view == 6}
                                      {$image.bySize.catalog_large.url}
                                  {else}
                                      {$image.bySize.home_default.url}
                                  {/if}
                              {else}
                                  {if Module::getInstanceByName('an_theme')->getParam('categoryPage_productsAmount') == 3}
                                      {$image.bySize.catalog_small.url}
                                  {elseif Module::getInstanceByName('an_theme')->getParam('categoryPage_productsAmount') == 4}
                                      {$image.bySize.home_default.url}
                                  {elseif Module::getInstanceByName('an_theme')->getParam('categoryPage_productsAmount') == 6}
                                      {$image.bySize.catalog_large.url}
                                  {else}
                                      {$image.bySize.home_default.url}
                                  {/if}
                              {/if}
                          {else}
                              {$image.bySize.home_default.url}
                        {/if}"
                        >
                        {/if}
                      {/foreach}
                      </a>
          {elseif Module::getInstanceByName('an_theme')->getParam('product_productImageChange') == 'hover-slider'}
            <a href="{$product.url}" class="thumbnail product-thumbnail hover_slider"
                                  style="height: {if isset($page) and ($page.page_name == 'category' or $page.page_name == 'new-products' or $page.page_name == 'prices-drop' or $page.page_name == 'best-sales' or $page.page_name == 'search' or $page.page_name == 'manufacturer')}{if isset($smarty.cookies.an_collection_view)|strip}{if $smarty.cookies.an_collection_view == 3}{$product.cover.bySize.catalog_small.height|strip}{elseif $smarty.cookies.an_collection_view == 4}{$product.cover.bySize.home_default.height|strip}{elseif $smarty.cookies.an_collection_view == 6}{$product.cover.bySize.catalog_large.height|strip}{else}{$product.cover.bySize.home_default.height|strip}{/if}{else}{if Module::getInstanceByName('an_theme')->getParam('categoryPage_productsAmount') == 3}{$product.cover.bySize.catalog_small.height|strip}{elseif Module::getInstanceByName('an_theme')->getParam('categoryPage_productsAmount') == 4}{$product.cover.bySize.home_default.height|strip}{elseif Module::getInstanceByName('an_theme')->getParam('categoryPage_productsAmount') == 6}{$product.cover.bySize.catalog_large.height|strip}{else}{$product.cover.bySize.home_default.height|strip}{/if}{/if}{else}{$product.cover.bySize.home_default.height|strip}{/if}px;">

              <ul {if $product.images|@count == 1} class="only_one_item"{/if}>
                <li class="cover-item">
                  <div class="hover-slider-img">
                    <img
                             							src="{if Module::getInstanceByName('an_theme')->getParam('product_lazyLoad')}
                             							 {$urls.base_url}/modules/an_theme/views/img/loading.svg
                             							 {else}
                             							    {if isset($page) and ($page.page_name == 'category' or $page.page_name == 'new-products' or $page.page_name == 'prices-drop' or $page.page_name == 'best-sales' or $page.page_name == 'search' or $page.page_name == 'manufacturer')}
                                                 {if isset($smarty.cookies.an_collection_view)}
                                                     {if $smarty.cookies.an_collection_view == 3}
                                                         {$product.cover.bySize.catalog_small.url}
                                                     {elseif $smarty.cookies.an_collection_view == 4}
                                                         {$product.cover.bySize.home_default.url}
                                                     {elseif $smarty.cookies.an_collection_view == 6}
                                                         {$product.cover.bySize.catalog_large.url}
                                                     {else}
                                                         {$product.cover.bySize.home_default.url}
                                                     {/if}
                                                 {else}
                                                       {if Module::getInstanceByName('an_theme')->getParam('categoryPage_productsAmount') == 3}
                                                         {$product.cover.bySize.catalog_small.url}
                                                     {elseif Module::getInstanceByName('an_theme')->getParam('categoryPage_productsAmount') == 4}
                                                         {$product.cover.bySize.home_default.url}
                                                     {elseif Module::getInstanceByName('an_theme')->getParam('categoryPage_productsAmount') == 6}
                                                         {$product.cover.bySize.catalog_large.url}
                                                     {else}
                                                         {$product.cover.bySize.home_default.url}
                                                     {/if}
                                                 {/if}
                                             {else}
                                                 {$product.cover.bySize.home_default.url}
                                             {/if}
                             							 {/if}"
                                            {if Module::getInstanceByName('an_theme')->getParam('product_lazyLoad')}
                                            data-lazy-gif="{$urls.base_url}/modules/an_theme/views/img/loading.svg"
                                            {/if}
                             							data-catalog-small="{$product.cover.bySize.catalog_small.url}"
                             							data-catalog-medium="{$product.cover.bySize.home_default.url}"
                             							data-catalog-large="{$product.cover.bySize.catalog_large.url}"
                             							alt="{if !empty($product.cover.legend)}{$product.cover.legend}{else}{$product.name|truncate:30:'...'}{/if}"
                             							data-full-size-image-url="{$product.cover.large.url}"
                             							class="{if Module::getInstanceByName('an_theme')->getParam('product_lazyLoad')} b-lazy {/if}  hover-slider-image"
                             							data-width="{$product.cover.bySize.home_default.width}"
                                                        data-height="{$product.cover.bySize.home_default.height}"
                                                        width="{$product.cover.bySize.home_default.width}"
                             							height="{$product.cover.bySize.home_default.height}"
                             							content="{$product.cover.bySize.home_default.url}"
                                           data-src="{if isset($page) and ($page.page_name == 'category' or $page.page_name == 'new-products' or $page.page_name == 'prices-drop' or $page.page_name == 'best-sales' or $page.page_name == 'search' or $page.page_name == 'manufacturer')}
                                                 {if isset($smarty.cookies.an_collection_view)}
                                                     {if $smarty.cookies.an_collection_view == 3}
                                                         {$product.cover.bySize.catalog_small.url}
                                                     {elseif $smarty.cookies.an_collection_view == 4}
                                                         {$product.cover.bySize.home_default.url}
                                                     {elseif $smarty.cookies.an_collection_view == 6}
                                                         {$product.cover.bySize.catalog_large.url}
                                                     {else}
                                                         {$product.cover.bySize.home_default.url}
                                                     {/if}
                                                 {else}
                                                     {if Module::getInstanceByName('an_theme')->getParam('categoryPage_productsAmount') == 3}
                                                         {$product.cover.bySize.catalog_small.url}
                                                     {elseif Module::getInstanceByName('an_theme')->getParam('categoryPage_productsAmount') == 4}
                                                         {$product.cover.bySize.home_default.url}
                                                     {elseif Module::getInstanceByName('an_theme')->getParam('categoryPage_productsAmount') == 6}
                                                         {$product.cover.bySize.catalog_large.url}
                                                     {else}
                                                         {$product.cover.bySize.home_default.url}
                                                     {/if}
                                                 {/if}
                                             {else}
                                                 {$product.cover.bySize.home_default.url}
                                             {/if}"
                             						>
                  </div>
                </li>
                          {$image_limit_other = $image_limit}
                          {foreach from=$product.images item=image name=hoverslider}
                              {if $smarty.foreach.hoverslider.iteration == $image_limit and $image.id_image == $product.cover.id_image }
                                {$image_limit_other = $image_limit-1}
                              {elseif $smarty.foreach.hoverslider.iteration > $image_limit and $image.id_image == $product.cover.id_image }
                                  {$image_limit_other = $image_limit-1}
                              {/if}
                          {/foreach}
                {foreach from=$product.images item=image name=hoverslider}
                              {if $image.id_image != $product.cover.id_image and $smarty.foreach.hoverslider.iteration <= $image_limit_other}
                    <li class="no-cover-item">
                      <div class="hover-slider-img">
                        {if Module::getInstanceByName('an_theme')->getParam('segmentedviewsettinds_textonlastimg') == 1}
                          {if $smarty.foreach.hoverslider.iteration == $image_limit_other and ($product.images|@count-$image_limit)>0}
                            <div class="more-images">
                              {$product.images|@count-$image_limit}
                              {if ($product.images|@count-$image_limit) == 1}
                                {l s='more image' d='Shop.Theme.Actions'}
                              {else}
                                {l s='more images' d='Shop.Theme.Actions'}
                              {/if}
                            </div>
                          {/if}
                        {/if}
                        <img
                                                      class="{if Module::getInstanceByName('an_theme')->getParam('product_lazyLoad')} b-lazy {/if}  hover-slider-image"
                                                      data-full-size-image-url="{$image.bySize.large_default.url}"
                                                      src="{if Module::getInstanceByName('an_theme')->getParam('product_lazyLoad')}
                                                      {$urls.base_url}/modules/an_theme/views/img/loading.svg
                                                      {else}
                                                      {if isset($page) and ($page.page_name == 'category' or $page.page_name == 'new-products' or $page.page_name == 'prices-drop' or $page.page_name == 'best-sales' or $page.page_name == 'search' or $page.page_name == 'manufacturer')}
                                                          {if isset($smarty.cookies.an_collection_view)}
                                                              {if $smarty.cookies.an_collection_view == 3}
                                                                  {$image.bySize.catalog_small.url}
                                                              {elseif $smarty.cookies.an_collection_view == 4}
                                                                  {$image.bySize.home_default.url}
                                                              {elseif $smarty.cookies.an_collection_view == 6}
                                                                  {$image.bySize.catalog_large.url}
                                                              {else}
                                                                  {$image.bySize.home_default.url}
                                                              {/if}
                                                          {else}
                                                              {if Module::getInstanceByName('an_theme')->getParam('categoryPage_productsAmount') == 3}
                                                                  {$image.bySize.catalog_small.url}
                                                              {elseif Module::getInstanceByName('an_theme')->getParam('categoryPage_productsAmount') == 4}
                                                                  {$image.bySize.home_default.url}
                                                              {elseif Module::getInstanceByName('an_theme')->getParam('categoryPage_productsAmount') == 6}
                                                                  {$image.bySize.catalog_large.url}
                                                              {else}
                                                                  {$image.bySize.home_default.url}
                                                              {/if}
                                                          {/if}
                                                      {else}
                                                          {$image.bySize.home_default.url}
                                                      {/if}
                                                  {/if}"
                                                  {if Module::getInstanceByName('an_theme')->getParam('product_lazyLoad')}
                                                  data-lazy-gif="{$urls.base_url}/modules/an_theme/views/img/loading.svg"
                                                  {/if}
                                                  data-catalog-small="{$image.bySize.catalog_small.url}"
                                                  data-catalog-medium="{$image.bySize.home_default.url}"
                                                  data-catalog-large="{$image.bySize.catalog_large.url}"
                                                  alt="{$image.legend}"
                                                  data-width="{$image.bySize.home_default.width}"
                                                  data-height="{$image.bySize.home_default.height}"
                                                  width="{$image.bySize.home_default.width}"
                                                  height="{$image.bySize.home_default.height}"
                                                  content="{$image.bySize.home_default.url}"
                                                  data-src="{if isset($page) and ($page.page_name == 'category' or $page.page_name == 'new-products' or $page.page_name == 'prices-drop' or $page.page_name == 'best-sales' or $page.page_name == 'search' or $page.page_name == 'manufacturer')}
                                                      {if isset($smarty.cookies.an_collection_view)}
                                                          {if $smarty.cookies.an_collection_view == 3}
                                                              {$image.bySize.catalog_small.url}
                                                          {elseif $smarty.cookies.an_collection_view == 4}
                                                              {$image.bySize.home_default.url}
                                                          {elseif $smarty.cookies.an_collection_view == 6}
                                                              {$image.bySize.catalog_large.url}
                                                          {else}
                                                              {$image.bySize.home_default.url}
                                                          {/if}
                                                      {else}
                                                          {if Module::getInstanceByName('an_theme')->getParam('categoryPage_productsAmount') == 3}
                                                              {$image.bySize.catalog_small.url}
                                                          {elseif Module::getInstanceByName('an_theme')->getParam('categoryPage_productsAmount') == 4}
                                                              {$image.bySize.home_default.url}
                                                          {elseif Module::getInstanceByName('an_theme')->getParam('categoryPage_productsAmount') == 6}
                                                              {$image.bySize.catalog_large.url}
                                                          {else}
                                                              {$image.bySize.home_default.url}
                                                          {/if}
                                                      {/if}
                                                  {else}
                                                      {$image.bySize.home_default.url}
                                                {/if}"
                                                >
                      </div>
                    </li>
                  {/if}
                {/foreach}
              </ul>
            </a>
          {else}
          <div class="slider_product-wrapper">
                      <div class="slider-product-item">
                       <a href="{$product.url}" class="thumbnail product-thumbnail"
                       style="height: {if isset($page) and ($page.page_name == 'category' or $page.page_name == 'new-products' or $page.page_name == 'prices-drop' or $page.page_name == 'best-sales' or $page.page_name == 'search' or $page.page_name == 'manufacturer')}{if isset($smarty.cookies.an_collection_view)|strip}{if $smarty.cookies.an_collection_view == 3}{$product.cover.bySize.catalog_small.height|strip}{elseif $smarty.cookies.an_collection_view == 4}{$product.cover.bySize.home_default.height|strip}{elseif $smarty.cookies.an_collection_view == 6}{$product.cover.bySize.catalog_large.height|strip}{else}{$product.cover.bySize.home_default.height|strip}{/if}{else}{if Module::getInstanceByName('an_theme')->getParam('categoryPage_productsAmount') == 3}{$product.cover.bySize.catalog_small.height|strip}{elseif Module::getInstanceByName('an_theme')->getParam('categoryPage_productsAmount') == 4}{$product.cover.bySize.home_default.height|strip}{elseif Module::getInstanceByName('an_theme')->getParam('categoryPage_productsAmount') == 6}{$product.cover.bySize.catalog_large.height|strip}{else}{$product.cover.bySize.home_default.height|strip}{/if}{/if}{else}{$product.cover.bySize.home_default.height|strip}{/if}px;">
                        <img
                        src="{if Module::getInstanceByName('an_theme')->getParam('product_lazyLoad')}
                              {$urls.base_url}/modules/an_theme/views/img/loading.svg
                          {else}
                              {if isset($page) and ($page.page_name == 'category' or $page.page_name == 'new-products' or $page.page_name == 'prices-drop' or $page.page_name == 'best-sales' or $page.page_name == 'search' or $page.page_name == 'manufacturer')}
                                  {if isset($smarty.cookies.an_collection_view)}
                                      {if $smarty.cookies.an_collection_view == 3}
                                          {$product.cover.bySize.catalog_small.url}
                                      {elseif $smarty.cookies.an_collection_view == 4}
                                          {$product.cover.bySize.home_default.url}
                                      {elseif $smarty.cookies.an_collection_view == 6}
                                          {$product.cover.bySize.catalog_large.url}
                                      {else}
                                          {$product.cover.bySize.home_default.url}
                                      {/if}
                                  {else}
                                      {if Module::getInstanceByName('an_theme')->getParam('categoryPage_productsAmount') == 3}
                                          {$product.cover.bySize.catalog_small.url}
                                      {elseif Module::getInstanceByName('an_theme')->getParam('categoryPage_productsAmount') == 4}
                                          {$product.cover.bySize.home_default.url}
                                      {elseif Module::getInstanceByName('an_theme')->getParam('categoryPage_productsAmount') == 6}
                                          {$product.cover.bySize.catalog_large.url}
                                      {else}
                                          {$product.cover.bySize.home_default.url}
                                      {/if}
                                  {/if}
                              {else}
                                  {$product.cover.bySize.home_default.url}
                              {/if}
                          {/if}"
                            {if Module::getInstanceByName('an_theme')->getParam('product_lazyLoad')}
                          data-lazy-gif="{$urls.base_url}/modules/an_theme/views/img/loading.svg"
                          {/if}
                          data-catalog-small="{$product.cover.bySize.catalog_small.url}"
                          data-catalog-medium="{$product.cover.bySize.home_default.url}"
                          data-catalog-large="{$product.cover.bySize.catalog_large.url}"
                         alt="{if !empty($product.cover.legend)}{$product.cover.legend}{else}{$product.name|truncate:30:'...'}{/if}"
                         data-full-size-image-url="{$product.cover.large.url}"
                         class="{if Module::getInstanceByName('an_theme')->getParam('product_lazyLoad')} b-lazy {/if} slider_product cover"
                         data-width="{$product.cover.bySize.home_default.width}"
                         data-height="{$product.cover.bySize.home_default.height}"
                         content="{$product.cover.bySize.home_default.url}"
                         data-src="{if isset($page) and ($page.page_name == 'category' or $page.page_name == 'new-products' or $page.page_name == 'prices-drop' or $page.page_name == 'best-sales' or $page.page_name == 'search' or $page.page_name == 'manufacturer')}
                          {if isset($smarty.cookies.an_collection_view)}
                              {if $smarty.cookies.an_collection_view == 3}
                                  {$product.cover.bySize.catalog_small.url}
                              {elseif $smarty.cookies.an_collection_view == 4}
                                  {$product.cover.bySize.home_default.url}
                              {elseif $smarty.cookies.an_collection_view == 6}
                                  {$product.cover.bySize.catalog_large.url}
                              {else}
                                  {$product.cover.bySize.home_default.url}
                              {/if}
                          {else}
                                {if Module::getInstanceByName('an_theme')->getParam('categoryPage_productsAmount') == 3}
                                  {$product.cover.bySize.catalog_small.url}
                              {elseif Module::getInstanceByName('an_theme')->getParam('categoryPage_productsAmount') == 4}
                                  {$product.cover.bySize.home_default.url}
                              {elseif Module::getInstanceByName('an_theme')->getParam('categoryPage_productsAmount') == 6}
                                  {$product.cover.bySize.catalog_large.url}
                              {else}
                                  {$product.cover.bySize.home_default.url}
                              {/if}
                          {/if}
                        {else}
                          {$product.cover.bySize.home_default.url}
                        {/if}"
                        >
                      </a>
                     </div>
                       {foreach from=$product.images item=image}
                         {if $image.id_image != $product.cover.id_image}
                         <div class="slider-product-item">
                         <a href="{$product.url}" class="thumbnail product-thumbnail"
                         style="height: {if isset($page) and ($page.page_name == 'category' or $page.page_name == 'new-products' or $page.page_name == 'prices-drop' or $page.page_name == 'best-sales' or $page.page_name == 'search' or $page.page_name == 'manufacturer')}{if isset($smarty.cookies.an_collection_view)|strip}{if $smarty.cookies.an_collection_view == 3}{$product.cover.bySize.catalog_small.height|strip}{elseif $smarty.cookies.an_collection_view == 4}{$product.cover.bySize.home_default.height|strip}{elseif $smarty.cookies.an_collection_view == 6}{$product.cover.bySize.catalog_large.height|strip}{else}{$product.cover.bySize.home_default.height|strip}{/if}{else}{if Module::getInstanceByName('an_theme')->getParam('categoryPage_productsAmount') == 3}{$product.cover.bySize.catalog_small.height|strip}{elseif Module::getInstanceByName('an_theme')->getParam('categoryPage_productsAmount') == 4}{$product.cover.bySize.home_default.height|strip}{elseif Module::getInstanceByName('an_theme')->getParam('categoryPage_productsAmount') == 6}{$product.cover.bySize.catalog_large.height|strip}{else}{$product.cover.bySize.home_default.height|strip}{/if}{/if}{else}{$product.cover.bySize.home_default.height|strip}{/if}px;">
                           <img
                           class="{if Module::getInstanceByName('an_theme')->getParam('product_lazyLoad')} b-lazy {/if} slider_product not_cover"
                            data-full-size-image-url="{$image.bySize.large_default.url}"
                            src="{if Module::getInstanceByName('an_theme')->getParam('product_lazyLoad')}
                              {$urls.base_url}/modules/an_theme/views/img/loading.svg
                              {else}
                                  {if isset($page) and ($page.page_name == 'category' or $page.page_name == 'new-products' or $page.page_name == 'prices-drop' or $page.page_name == 'best-sales' or $page.page_name == 'search' or $page.page_name == 'manufacturer')}
                              {if isset($smarty.cookies.an_collection_view)}
                                  {if $smarty.cookies.an_collection_view == 3}
                                      {$image.bySize.catalog_small.url}
                                  {elseif $smarty.cookies.an_collection_view == 4}
                                      {$image.bySize.home_default.url}
                                  {elseif $smarty.cookies.an_collection_view == 6}
                                      {$image.bySize.catalog_large.url}
                                  {else}
                                      {$image.bySize.home_default.url}
                                  {/if}
                              {else}
                                    {if Module::getInstanceByName('an_theme')->getParam('categoryPage_productsAmount') == 3}
                                      {$image.bySize.catalog_small.url}
                                  {elseif Module::getInstanceByName('an_theme')->getParam('categoryPage_productsAmount') == 4}
                                      {$image.bySize.home_default.url}
                                  {elseif Module::getInstanceByName('an_theme')->getParam('categoryPage_productsAmount') == 6}
                                      {$image.bySize.catalog_large.url}
                                  {else}
                                      {$image.bySize.home_default.url}
                                  {/if}
                              {/if}
                          {else}
                              {$image.bySize.home_default.url}
                          {/if}
                          {/if}"
                          {if Module::getInstanceByName('an_theme')->getParam('product_lazyLoad')}
                        data-lazy-gif="{$urls.base_url}/modules/an_theme/views/img/loading.svg"
                        {/if}
                          data-catalog-small="{$image.bySize.catalog_small.url}"
                          data-catalog-medium="{$image.bySize.home_default.url}"
                          data-catalog-large="{$image.bySize.catalog_large.url}"
                          alt="{$image.legend}"
                          data-width="{$image.bySize.home_default.width}"
                          data-height="{$image.bySize.home_default.height}"
                          content="{$image.bySize.home_default.url}"
                          data-src="{if isset($page) and ($page.page_name == 'category' or $page.page_name == 'new-products' or $page.page_name == 'prices-drop' or $page.page_name == 'best-sales' or $page.page_name == 'search' or $page.page_name == 'manufacturer')}
                              {if isset($smarty.cookies.an_collection_view)}
                                  {if $smarty.cookies.an_collection_view == 3}
                                      {$image.bySize.catalog_small.url}
                                  {elseif $smarty.cookies.an_collection_view == 4}
                                      {$image.bySize.home_default.url}
                                  {elseif $smarty.cookies.an_collection_view == 6}
                                      {$image.bySize.catalog_large.url}
                                  {else}
                                      {$image.bySize.home_default.url}
                                  {/if}
                              {else}
                                  {if Module::getInstanceByName('an_theme')->getParam('categoryPage_productsAmount') == 3}
                                      {$image.bySize.catalog_small.url}
                                  {elseif Module::getInstanceByName('an_theme')->getParam('categoryPage_productsAmount') == 4}
                                      {$image.bySize.home_default.url}
                                  {elseif Module::getInstanceByName('an_theme')->getParam('categoryPage_productsAmount') == 6}
                                      {$image.bySize.catalog_large.url}
                                  {else}
                                      {$image.bySize.home_default.url}
                                  {/if}
                              {/if}
                          {else}
                              {$image.bySize.home_default.url}
                          {/if}"
                           >
                          </a>
                         </div>
                          {/if}
                         {/foreach}
                     </div>
          {/if}
      {else}
      <a href="{$product.url}" class="thumbnail product-thumbnail"
            style="height: {if isset($page) and ($page.page_name == 'category' or $page.page_name == 'new-products' or $page.page_name == 'prices-drop' or $page.page_name == 'best-sales' or $page.page_name == 'search' or $page.page_name == 'manufacturer')}{if isset($smarty.cookies.an_collection_view)|strip}{if $smarty.cookies.an_collection_view == 3}{$product.cover.bySize.catalog_small.height|strip}{elseif $smarty.cookies.an_collection_view == 4}{$product.cover.bySize.home_default.height|strip}{elseif $smarty.cookies.an_collection_view == 6}{$product.cover.bySize.catalog_large.height|strip}{else}{$product.cover.bySize.home_default.height|strip}{/if}{else}{if Module::getInstanceByName('an_theme')->getParam('categoryPage_productsAmount') == 3}{$product.cover.bySize.catalog_small.height|strip}{elseif Module::getInstanceByName('an_theme')->getParam('categoryPage_productsAmount') == 4}{$product.cover.bySize.home_default.height|strip}{elseif Module::getInstanceByName('an_theme')->getParam('categoryPage_productsAmount') == 6}{$product.cover.bySize.catalog_large.height|strip}{else}{$product.cover.bySize.home_default.height|strip}{/if}{/if}{else}{$product.cover.bySize.home_default.height|strip}{/if}px;">
      					<img
      					src="{if Module::getInstanceByName('an_theme')->getParam('product_lazyLoad')}
      							 {$urls.base_url}/modules/an_theme/views/img/loading.svg
      							 {else}
      							    {if isset($page) and ($page.page_name == 'category' or $page.page_name == 'new-products' or $page.page_name == 'prices-drop' or $page.page_name == 'best-sales' or $page.page_name == 'search' or $page.page_name == 'manufacturer')}
                          {if isset($smarty.cookies.an_collection_view)}
                              {if $smarty.cookies.an_collection_view == 3}
                                  {$product.cover.bySize.catalog_small.url}
                              {elseif $smarty.cookies.an_collection_view == 4}
                                  {$product.cover.bySize.home_default.url}
                              {elseif $smarty.cookies.an_collection_view == 6}
                                  {$product.cover.bySize.catalog_large.url}
                              {else}
                                  {$product.cover.bySize.home_default.url}
                              {/if}
                          {else}
                                {if Module::getInstanceByName('an_theme')->getParam('categoryPage_productsAmount') == 3}
                                  {$product.cover.bySize.catalog_small.url}
                              {elseif Module::getInstanceByName('an_theme')->getParam('categoryPage_productsAmount') == 4}
                                  {$product.cover.bySize.home_default.url}
                              {elseif Module::getInstanceByName('an_theme')->getParam('categoryPage_productsAmount') == 6}
                                  {$product.cover.bySize.catalog_large.url}
                              {else}
                                  {$product.cover.bySize.home_default.url}
                              {/if}
                          {/if}
                      {else}
                          {$product.cover.bySize.home_default.url}
                      {/if}
      							 {/if}"
                     {if Module::getInstanceByName('an_theme')->getParam('product_lazyLoad')}
                     data-lazy-gif="{$urls.base_url}/modules/an_theme/views/img/loading.svg"
                     {/if}
      							data-catalog-small="{$product.cover.bySize.catalog_small.url}"
      							data-catalog-medium="{$product.cover.bySize.home_default.url}"
      							data-catalog-large="{$product.cover.bySize.catalog_large.url}"
      						alt="{if !empty($product.cover.legend)}{$product.cover.legend}{else}{$product.name|truncate:30:'...'}{/if}"
      						data-full-size-image-url="{$product.cover.large.url}"
      						class="{if Module::getInstanceByName('an_theme')->getParam('product_lazyLoad')} b-lazy {/if} "
      						data-width="{$product.cover.bySize.home_default.width}"
      						data-height="{$product.cover.bySize.home_default.height}"
      						content="{$product.cover.bySize.home_default.url}"
      						data-src="{if isset($page) and ($page.page_name == 'category' or $page.page_name == 'new-products' or $page.page_name == 'prices-drop' or $page.page_name == 'best-sales' or $page.page_name == 'search' or $page.page_name == 'manufacturer')}
                      {if isset($smarty.cookies.an_collection_view)}
                          {if $smarty.cookies.an_collection_view == 3}
                              {$product.cover.bySize.catalog_small.url}
                          {elseif $smarty.cookies.an_collection_view == 4}
                              {$product.cover.bySize.home_default.url}
                          {elseif $smarty.cookies.an_collection_view == 6}
                              {$product.cover.bySize.catalog_large.url}
                          {else}
                              {$product.cover.bySize.home_default.url}
                          {/if}
                      {else}
                            {if Module::getInstanceByName('an_theme')->getParam('categoryPage_productsAmount') == 3}
                              {$product.cover.bySize.catalog_small.url}
                          {elseif Module::getInstanceByName('an_theme')->getParam('categoryPage_productsAmount') == 4}
                              {$product.cover.bySize.home_default.url}
                          {elseif Module::getInstanceByName('an_theme')->getParam('categoryPage_productsAmount') == 6}
                              {$product.cover.bySize.catalog_large.url}
                          {else}
                              {$product.cover.bySize.home_default.url}
                          {/if}
                      {/if}
                    {/if}"
      					>
      	    </a>
    {/if}
    {/if}
    {/block}
		 {if !Module::isEnabled('an_productattributes')}
           {block name='product_variants'}
           {if $product.main_variants}
             {include file='catalog/_partials/variant-links.tpl' variants=$product.main_variants}
           {/if}
           {/block}
         {/if}

    			<div class="highlighted-informations{if !$product.main_variants} no-variants{/if} hidden-sm-down">
                    {block name='product_wishlist'}
                     {hook h='displayProductListWishlist' product=$product}
                     {/block}

                     {if Module::isEnabled('an_theme') and Module::getInstanceByName('an_theme')->getParam('product_showquickview') == 1}
                      {block name='quick_view'}

                        <a class="quick-view" href="#" data-link-action="quickview">
                          <svg
                           xmlns="http://www.w3.org/2000/svg"
                           xmlns:xlink="http://www.w3.org/1999/xlink"
                           width="16px" height="16px">
                          <path fill-rule="evenodd"  fill="rgb(0, 0, 0)"
                           d="M15.809,15.809 C15.682,15.936 15.516,16.000 15.350,16.000 C15.183,16.000 15.017,15.936 14.890,15.809 L11.522,12.442 C10.301,13.457 8.754,14.092 7.046,14.092 C3.161,14.092 -0.000,10.931 -0.000,7.046 C-0.000,3.161 3.161,-0.000 7.046,-0.000 C10.931,-0.000 14.092,3.161 14.092,7.046 C14.092,8.754 13.457,10.301 12.442,11.522 L15.809,14.890 C16.063,15.144 16.063,15.556 15.809,15.809 ZM7.046,1.301 C3.878,1.301 1.301,3.878 1.301,7.046 C1.301,10.214 3.878,12.791 7.046,12.791 C10.214,12.791 12.791,10.214 12.791,7.046 C12.791,3.878 10.214,1.301 7.046,1.301 Z"/>
                          </svg>
                        </a>
                      {/block}
                       {/if}
    			</div>


       {block name='product_flags'}
       <a href="{$product.url}">
         <ul class="product-flags">
           {foreach from=$product.flags item=flag}
             <li class="{$flag.type}">{$flag.label}</li>
           {/foreach}

           {if $product.has_discount}
             {if $product.discount_type === 'percentage'}
              <li class="discount-percentage">{$product.discount_percentage}</span>
             {/if}
           {/if}
         </ul>
     </a>
     {/block}
        </div>
      <div class="product-description">
      {block name='product_reviews'}
        {hook h='displayProductListReviews' product=$product}
      {/block}
        {block name='product_name'}
          <h3 class="h3 product-title" itemprop="name"><a href="{$product.url}">
           {if Module::isEnabled('an_theme') and Module::getInstanceByName('an_theme')->getParam('product_miniatureTitleLength')}
              {$max_titlelength = Module::getInstanceByName('an_theme')->getParam('product_miniatureTitleLength')}
               {$product.name|truncate:$max_titlelength:'...'}
            {else}
              {$product.name|truncate:30:'...'}
            {/if}
          </a></h3>
        {/block}
        

        {block name='product_price_and_shipping'}
          {if $product.show_price}
            <div class="product-price-and-shipping" itemprop="offers" itemscope itemtype="http://schema.org/Offer" priceValidUntil="">
                <meta itemprop="priceCurrency" content="{if isset($currency_code)}{$currency_code}{/if}">
                <meta itemprop="url" content="{$product.url}">
                <link itemprop="availability" href="http://schema.org/InStock">
              {hook h='displayProductPriceBlock' product=$product type="before_price"}
                  <div class="product-prices-block">

                {if (Module::isEnabled('an_theme') and Module::getInstanceByName('an_theme')->getParam('product_shortdescription') == 1) or (
                          Module::isEnabled('an_theme') and Module::getInstanceByName('an_theme')->getParam('product_shortdescription') == 0 and isset($page) and ($page.page_name == 'category' or $page.page_name == 'new-products' or $page.page_name == 'prices-drop' or $page.page_name == 'best-sales' or $page.page_name == 'search' or $page.page_name == 'manufacturer'))}
                      {$max_length = Module::getInstanceByName('an_theme')->getParam('product_shortdescriptionlength')}
                              {block name='product_description_short'}
                                              <p class="an_short_description {if Module::isEnabled('an_theme') and Module::getInstanceByName('an_theme')->getParam('product_shortdescription') == 0 and isset($page) and ($page.page_name == 'category' or $page.page_name == 'new-products' or $page.page_name == 'prices-drop' or $page.page_name == 'best-sales' or $page.page_name == 'search' or $page.page_name == 'manufacturer')}grid-view-desc{/if}" id="an_short_description_{$product.id}">
                                                              {if Module::isEnabled('an_theme') and Module::getInstanceByName('an_theme')->getParam('product_shortdescription') == 0 and isset($page) and ($page.page_name == 'category' or $page.page_name == 'new-products' or $page.page_name == 'prices-drop' or $page.page_name == 'best-sales' or $page.page_name == 'search' or $page.page_name == 'manufacturer')}
                                                                              {$product.description_short|strip_tags:'UTF-8'|truncate:300:'...'}
                                                              {else}
                                                                              {$product.description_short|strip_tags:'UTF-8'|truncate:$max_length:'...'}
                                                              {/if}
                                              </p>
                              {/block}
                      {/if}
                      <span class="price" itemprop="price" content="{$product.price_tax_exc}">
                                          <span class="money" {if isset($currency_code)}data-currency-{$currency_code|lower}="{$product.price}"{/if}>{$product.price}</span>
                                      </span>
                                    {if $product.has_discount}
                                      {hook h='displayProductPriceBlock' product=$product type="old_price"}

                                      <span class="regular-price">{$product.regular_price}</span>
                                    {/if}
                </div>

              {hook h='displayProductPriceBlock' product=$product type='unit_price'}

            {hook h='displayProductPriceBlock' product=$product type='weight'}
           {/if}


      {/block}

      
    </div>

   

  </article>
{/block}

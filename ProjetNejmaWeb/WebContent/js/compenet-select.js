var ComponentsSelect2=function(){var e=function(){function e(e){if(e.loading)return e.text;var t="<div class='select2-result-repository clearfix'><div class='select2-result-repository__avatar'><img src='"+e.owner.avatar_url+"' /></div><div class='select2-result-repository__meta'><div class='select2-result-repository__title'>"+e.full_name+"</div>";return e.description&&(t+="<div class='select2-result-repository__description'>"+e.description+"</div>"),t+="<div class='select2-result-repository__statistics'><div class='select2-result-repository__forks'><span class='glyphicon glyphicon-flash'></span> "+e.forks_count+" Forks</div><div class='select2-result-repository__stargazers'><span class='glyphicon glyphicon-star'></span> "+e.stargazers_count+" Stars</div><div class='select2-result-repository__watchers'><span class='glyphicon glyphicon-eye-open'></span> "+e.watchers_count+" Watchers</div></div></div></div>"}function t(e){return e.full_name||e.text}$.fn.select2.defaults.set("theme","bootstrap");var s="Select a State";$(".select2, .select2-multiple").select2({placeholder:s,width:null}),$(".select2-allow-clear").select2({allowClear:!0,placeholder:s,width:null}),$(".js-data-example-ajax").select2({width:"off",ajax:{url:"https://api.github.com/search/repositories",dataType:"json",delay:250,data:function(e){return{q:e.term,page:e.page}},processResults:function(e,t){return{results:e.items}},cache:!0},escapeMarkup:function(e){return e},minimumInputLength:1,templateResult:e,templateSelection:t}),$("button[data-select2-open]").click(function(){$("#"+$(this).data("select2-open")).select2("open")}),$(":checkbox").on("click",function(){$(this).parent().nextAll("select").prop("disabled",!this.checked)}),$(".select2, .select2-multiple, .select2-allow-clear, .js-data-example-ajax").on("select2:open",function(){if($(this).parents("[class*='has-']").length)for(var e=$(this).parents("[class*='has-']")[0].className.split(/\s+/),t=0;t<e.length;++t)e[t].match("has-")&&$("body > .select2-container").addClass(e[t])}),$(".js-btn-set-scaling-classes").on("click",function(){$("#select2-multiple-input-sm, #select2-single-input-sm").next(".select2-container--bootstrap").addClass("input-sm"),$("#select2-multiple-input-lg, #select2-single-input-lg").next(".select2-container--bootstrap").addClass("input-lg"),$(this).removeClass("btn-primary btn-outline").prop("disabled",!0)})};return{init:function(){e()}}}();jQuery(document).ready(function(){ComponentsSelect2.init()});
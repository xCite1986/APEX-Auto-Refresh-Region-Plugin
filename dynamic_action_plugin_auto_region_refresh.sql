prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_200100 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2020.03.31'
,p_release=>'20.1.0.00.13'
,p_default_workspace_id=>82514646741174367
,p_default_application_id=>251
,p_default_id_offset=>0
,p_default_owner=>'A192577'
);
end;
/
 
prompt APPLICATION 251 - Auto Refresh Plugin
--
-- Application Export:
--   Application:     251
--   Name:            Auto Refresh Plugin
--   Date and Time:   22:52 Donnerstag Mai 14, 2020
--   Exported By:     ALEXANDER.PROHASKA@GMAIL.COM
--   Flashback:       0
--   Export Type:     Component Export
--   Manifest
--     PLUGIN: 105266930174777922
--   Manifest End
--   Version:         20.1.0.00.13
--   Instance ID:     248281793889903
--

begin
  -- replace components
  wwv_flow_api.g_mode := 'REPLACE';
end;
/
prompt --application/shared_components/plugins/dynamic_action/plugin_da_auto_region_refresh
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(105266930174777922)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'PLUGIN.DA.AUTO.REGION.REFRESH'
,p_display_name=>'Auto Refresh Region'
,p_category=>'INIT'
,p_supported_ui_types=>'DESKTOP'
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'----------------------------------------------------------',
'-- Author  : Alex Prohaska',
'-- Mail    : alexander.prohaska@gmail.com',
'-- Blog    : http://webapplications.cloud/apex/f?p=251',
'-- Created : 14.05.2020',
'-- Purpose : Refresh Plugin for Classic Reports',
'-- Version : v.1.0.0 ',
'----------------------------------------------------------',
'',
'FUNCTION f_refresh     (p_dynamic_action IN apex_plugin.t_dynamic_action,',
'                        p_plugin         IN apex_plugin.t_plugin )',
'                        ',
'  RETURN apex_plugin.t_dynamic_action_render_result',
'',
'IS',
'',
'  v_return      apex_plugin.t_dynamic_action_render_result;',
'  v_js          varchar2(2000); ',
'',
'-- add javascript',
'BEGIN',
'  v_return.javascript_function := ''function(){null}'';  ',
'  v_js := ''setInterval("jQuery(''||p_dynamic_action.attribute_01||'').trigger(''''apexrefresh'''');",''||p_dynamic_action.attribute_02*1000||'');'';    ',
'                              ',
'  apex_javascript.add_onload_code(p_code => v_js);   ',
'  ',
'RETURN v_return;',
'',
'END f_refresh;',
''))
,p_api_version=>1
,p_render_function=>'f_refresh'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_help_text=>'Plugin that reload classic or interactive report region after certain time.'
,p_version_identifier=>'1.0.0'
,p_about_url=>'http://webapplications.cloud/apex/f?p=251'
,p_plugin_comment=>'First Release date: 14.05.2020'
,p_files_version=>6
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(105267896087814031)
,p_plugin_id=>wwv_flow_api.id(105266930174777922)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Region Static ID'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_translatable=>false
,p_help_text=>'Define region Static ID wich should be reloaded'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(97696145850465656)
,p_plugin_id=>wwv_flow_api.id(105266930174777922)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Reload Interval'
,p_attribute_type=>'NUMBER'
,p_is_required=>false
,p_default_value=>'10'
,p_unit=>'sec.'
,p_is_translatable=>false
);
end;
/
prompt --application/end_environment
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false));
commit;
end;
/
set verify on feedback on define on
prompt  ...done

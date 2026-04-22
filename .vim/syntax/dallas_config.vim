" Vim syntax file
"
" file type: Dallas configuration files

" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
    finish
endif

" Keywords
syntax keyword DallasCommands apn ms_group_gtp weighted_payload_profile replay_payload_profile capture_file_profile gsm_payload_profile gi_net total_number_of_subscribers qos_profile qos_profile_4g qos_weighted_profile ms_group udp_payload_profile router_sol ho_with_sec_pdp_2g3g_lte sms_profile default_dualstack_ipv6_perc 
syntax keyword DallasVariable imsi_series msisdn_series imei_series priv_ext_update priv_ext_create charg_char radius_authentication rat_type ip_address_type tgnat
syntax keyword DallasConst    sgsn sgw s4_sgsn mme  utran eutran ipv4 ipv6 ipv4ipv6 ipv4asipv6 dynamic false true r z u evolved_arp isi_ssd_inc conversational streaming interactive 

" Matches
syntax match DallasString "'[^']*'"
" Comments
syntax match DallasComments "%%.*$"

highlight DallasCommands   ctermfg=Magenta ctermbg=Black cterm=bold
highlight DallasComments   ctermfg=Blue    ctermbg=Black 
highlight DallasVariable   ctermfg=Cyan    ctermbg=Black 
highlight DallasConst      ctermfg=Yellow  ctermbg=Black 
highlight DallasString     ctermfg=White   ctermbg=Black cterm=bold

let b:current_syntax = "dallas_config"

#!/usr/bin/perl
# Do not normalise this test file. It has deliberately unnormalised characters in it.
use v5.10;
use strict;
use warnings;
use utf8;
use if $^V ge v5.12.0, feature => 'unicode_strings';

use Test::More tests => 24;
use Test::Exception;

use ok 'Locale::CLDR';

my $locale = Locale::CLDR->new('bg');

my $other_locale = Locale::CLDR->new('en_US');
is($locale->locale_name(), 'български', 'Locale name from current locale');
is($locale->locale_name('fr_CA'), 'френски (Канада)', 'Locale name from string');
is($locale->locale_name($other_locale), 'английски (САЩ)', 'Locale name from other locale object');
is($locale->language_name(), 'български', 'Language name from current locale');
is($locale->language_name('fr'), 'френски', 'Language name from string');
is($locale->language_name($other_locale), 'английски', 'Language name from other locale object');

my $all_languages = {
	'aa' => 'афарски',
	'ab' => 'абхазки',
	'ace' => 'ачешки',
	'ach' => 'аколи',
	'ada' => 'адангме',
	'ady' => 'адигейски',
	'ae' => 'авестски',
	'af' => 'африканс',
	'afh' => 'африхили',
	'agq' => 'агем',
	'ain' => 'айну',
	'ak' => 'акан',
	'akk' => 'акадски',
	'ale' => 'алеутски',
	'alt' => 'южноалтайски',
	'am' => 'амхарски',
	'an' => 'арагонски',
	'ang' => 'староанглийски',
	'anp' => 'ангика',
	'ar' => 'арабски',
	'ar_001' => 'съвременен стандартен арабски',
	'arc' => 'арамейски',
	'arn' => 'мапуче',
	'arp' => 'арапахо',
	'arw' => 'аравак',
	'as' => 'асамски',
	'asa' => 'асу',
	'ast' => 'астурски',
	'av' => 'аварски',
	'awa' => 'авади',
	'ay' => 'аймара',
	'az' => 'азербайджански',
	'az@alt=short' => 'азерски',
	'ba' => 'башкирски',
	'bal' => 'балучи',
	'ban' => 'балийски',
	'bas' => 'баса',
	'be' => 'беларуски',
	'bej' => 'бея',
	'bem' => 'бемба',
	'bez' => 'бена',
	'bg' => 'български',
	'bgn' => 'западен балочи',
	'bho' => 'божпури',
	'bi' => 'бислама',
	'bik' => 'биколски',
	'bin' => 'бини',
	'bla' => 'сиксика',
	'bm' => 'бамбара',
	'bn' => 'бенгалски',
	'bo' => 'тибетски',
	'br' => 'бретонски',
	'bra' => 'брадж',
	'brx' => 'бодо',
	'bs' => 'босненски',
	'bua' => 'бурятски',
	'bug' => 'бугински',
	'byn' => 'биленски',
	'ca' => 'каталонски',
	'cad' => 'каддо',
	'car' => 'карибски',
	'cch' => 'атсам',
	'ce' => 'чеченски',
	'ceb' => 'себуански',
	'cgg' => 'чига',
	'ch' => 'чаморо',
	'chb' => 'чибча',
	'chg' => 'чагатай',
	'chk' => 'чуук',
	'chm' => 'марийски',
	'chn' => 'жаргон чинуук',
	'cho' => 'чокто',
	'chp' => 'чиипувски',
	'chr' => 'черокски',
	'chy' => 'чейенски',
	'ckb' => 'кюрдски (централен)',
	'co' => 'корсикански',
	'cop' => 'коптски',
	'cr' => 'крии',
	'crh' => 'кримскотатарски',
	'crs' => 'сеселва, креолски френски',
	'cs' => 'чешки',
	'csb' => 'кашубски',
	'cu' => 'църковнославянски',
	'cv' => 'чувашки',
	'cy' => 'уелски',
	'da' => 'датски',
	'dak' => 'дакотски',
	'dar' => 'даргва',
	'dav' => 'таита',
	'de' => 'немски',
	'del' => 'делауер',
	'den' => 'слейви',
	'dgr' => 'догриб',
	'din' => 'динка',
	'dje' => 'зарма',
	'doi' => 'догри',
	'dsb' => 'долнолужишки',
	'dua' => 'дуала',
	'dum' => 'средновековен холандски',
	'dv' => 'дивехи',
	'dyo' => 'диола-фони',
	'dyu' => 'диула',
	'dz' => 'дзонгкха',
	'dzg' => 'дазага',
	'ebu' => 'ембу',
	'ee' => 'еве',
	'efi' => 'ефик',
	'egy' => 'древноегипетски',
	'eka' => 'екажук',
	'el' => 'гръцки',
	'elx' => 'еламитски',
	'en' => 'английски',
	'en_GB@alt=short' => 'английски (UK)',
	'en_US' => 'английски (САЩ)',
	'en_US@alt=short' => 'английски (US)',
	'enm' => 'средновековен английски',
	'eo' => 'есперанто',
	'es' => 'испански',
	'et' => 'естонски',
	'eu' => 'баски',
	'ewo' => 'евондо',
	'fa' => 'персийски',
	'fan' => 'фанг',
	'fat' => 'фанти',
	'ff' => 'фула',
	'fi' => 'фински',
	'fil' => 'филипински',
	'fj' => 'фиджийски',
	'fo' => 'фарьорски',
	'fon' => 'фон',
	'fr' => 'френски',
	'frm' => 'средновековен френски',
	'fro' => 'старофренски',
	'frr' => 'северен фризски',
	'frs' => 'източнофризийски',
	'fur' => 'фриулиански',
	'fy' => 'западнофризийски',
	'ga' => 'ирландски',
	'gaa' => 'га',
	'gag' => 'гагаузки',
	'gay' => 'гайо',
	'gba' => 'гбая',
	'gd' => 'шотландски галски',
	'gez' => 'гииз',
	'gil' => 'гилбертски',
	'gl' => 'галисийски',
	'gmh' => 'средновисоконемски',
	'gn' => 'гуарани',
	'goh' => 'старовисоконемски',
	'gon' => 'гонди',
	'gor' => 'горонтало',
	'got' => 'готически',
	'grb' => 'гребо',
	'grc' => 'древногръцки',
	'gsw' => 'швейцарски немски',
	'gu' => 'гуджарати',
	'guz' => 'гусии',
	'gv' => 'манкски',
	'gwi' => 'гвичин',
	'ha' => 'хауса',
	'hai' => 'хайда',
	'haw' => 'хавайски',
	'he' => 'иврит',
	'hi' => 'хинди',
	'hil' => 'хилигайнон',
	'hit' => 'хитски',
	'hmn' => 'хмонг',
	'ho' => 'хири моту',
	'hr' => 'хърватски',
	'hsb' => 'горнолужишки',
	'ht' => 'хаитянски креолски',
	'hu' => 'унгарски',
	'hup' => 'хупа',
	'hy' => 'арменски',
	'hz' => 'хереро',
	'ia' => 'интерлингва',
	'iba' => 'ибан',
	'ibb' => 'ибибио',
	'id' => 'индонезийски',
	'ie' => 'оксидентал',
	'ig' => 'игбо',
	'ii' => 'съчуански и',
	'ik' => 'инупиак',
	'ilo' => 'илоко',
	'inh' => 'ингушетски',
	'io' => 'идо',
	'is' => 'исландски',
	'it' => 'италиански',
	'iu' => 'инуктитут',
	'ja' => 'японски',
	'jbo' => 'ложбан',
	'jgo' => 'нгомба',
	'jmc' => 'мачаме',
	'jpr' => 'юдео-персийски',
	'jrb' => 'юдео-арабски',
	'jv' => 'явански',
	'ka' => 'грузински',
	'kaa' => 'каракалпашки',
	'kab' => 'кабилски',
	'kac' => 'качински',
	'kaj' => 'жжу',
	'kam' => 'камба',
	'kaw' => 'кави',
	'kbd' => 'кабардиан',
	'kcg' => 'туап',
	'kde' => 'маконде',
	'kea' => 'кабовердиански',
	'kfo' => 'коро',
	'kg' => 'конгоански',
	'kha' => 'кхаси',
	'kho' => 'котски',
	'khq' => 'койра чиини',
	'ki' => 'кикую',
	'kj' => 'кваняма',
	'kk' => 'казахски',
	'kkj' => 'како',
	'kl' => 'гренландски',
	'kln' => 'календжин',
	'km' => 'кхмерски',
	'kmb' => 'кимбунду',
	'kn' => 'каннада',
	'ko' => 'корейски',
	'koi' => 'коми-пермякски',
	'kok' => 'конкани',
	'kos' => 'косраен',
	'kpe' => 'кпеле',
	'kr' => 'канури',
	'krc' => 'карачай-балкарски',
	'krl' => 'карелски',
	'kru' => 'курук',
	'ks' => 'кашмирски',
	'ksb' => 'шамбала',
	'ksf' => 'бафия',
	'ksh' => 'кьолнски',
	'ku' => 'кюрдски',
	'kum' => 'кумикски',
	'kut' => 'кутенай',
	'kv' => 'коми',
	'kw' => 'корнуолски',
	'ky' => 'киргизки',
	'la' => 'латински',
	'lad' => 'ладино',
	'lag' => 'ланги',
	'lah' => 'лахнда',
	'lam' => 'ламба',
	'lb' => 'люксембургски',
	'lez' => 'лезгински',
	'lg' => 'ганда',
	'li' => 'лимбургски',
	'lkt' => 'лакота',
	'ln' => 'лингала',
	'lo' => 'лаоски',
	'lol' => 'монго',
	'loz' => 'лози',
	'lrc' => 'северен лури',
	'lt' => 'литовски',
	'lu' => 'луба-катанга',
	'lua' => 'луба-лулуа',
	'lui' => 'луисеньо',
	'lun' => 'лунда',
	'luo' => 'луо',
	'lus' => 'мизо',
	'luy' => 'лухя',
	'lv' => 'латвийски',
	'mad' => 'мадурски',
	'mag' => 'магахи',
	'mai' => 'майтхили',
	'mak' => 'макасар',
	'man' => 'мандинго',
	'mas' => 'масайски',
	'mdf' => 'мокша',
	'mdr' => 'мандар',
	'men' => 'менде',
	'mer' => 'меру',
	'mfe' => 'морисиен',
	'mg' => 'малгашки',
	'mga' => 'средновековен ирландски',
	'mgh' => 'макуа мето',
	'mgo' => 'мета',
	'mh' => 'маршалезе',
	'mi' => 'маорски',
	'mic' => 'микмак',
	'min' => 'минангкабау',
	'mk' => 'македонски',
	'ml' => 'малаялам',
	'mn' => 'монголски',
	'mnc' => 'манджурски',
	'mni' => 'манипурски',
	'moh' => 'мохоук',
	'mos' => 'моси',
	'mr' => 'марати',
	'ms' => 'малайски',
	'mt' => 'малтийски',
	'mua' => 'мунданг',
	'mul' => 'многоезични',
	'mus' => 'крик',
	'mwl' => 'мирандийски',
	'mwr' => 'марвари',
	'my' => 'бирмански',
	'myv' => 'ерзиа',
	'mzn' => 'мазандари',
	'na' => 'науру',
	'nap' => 'неаполитански',
	'naq' => 'нама',
	'nb' => 'норвежки (букмол)',
	'nd' => 'северен ндебеле',
	'nds' => 'долнонемски',
	'nds_NL' => 'долносаксонски',
	'ne' => 'непалски',
	'new' => 'неварски',
	'ng' => 'ндонга',
	'nia' => 'ниас',
	'niu' => 'ниуеан',
	'nl' => 'нидерландски',
	'nl_BE' => 'фламандски',
	'nmg' => 'квасио',
	'nn' => 'норвежки (нюношк)',
	'nnh' => 'нгиембун',
	'no' => 'норвежки',
	'nog' => 'ногаи',
	'non' => 'старонорвежки',
	'nqo' => 'нко',
	'nr' => 'южен ндебеле',
	'nso' => 'северен сото',
	'nus' => 'нуер',
	'nv' => 'навахо',
	'nwc' => 'класически невари',
	'ny' => 'нянджа',
	'nym' => 'ниамвези',
	'nyn' => 'нянколе',
	'nyo' => 'нуоро',
	'nzi' => 'нзима',
	'oc' => 'окситански',
	'oj' => 'оджибва',
	'om' => 'оромо',
	'or' => 'ория',
	'os' => 'осетски',
	'osa' => 'осейджи',
	'ota' => 'отомански турски',
	'pa' => 'пенджабски',
	'pag' => 'пангасинан',
	'pal' => 'пахлави',
	'pam' => 'пампанга',
	'pap' => 'папиаменто',
	'pau' => 'палауан',
	'pcm' => 'нигерийски пиджин',
	'peo' => 'староперсийски',
	'phn' => 'финикийски',
	'pi' => 'пали',
	'pl' => 'полски',
	'pon' => 'понапеан',
	'prg' => 'пруски',
	'pro' => 'старопровансалски',
	'ps' => 'пущу',
	'ps@alt=variant' => 'пущунски',
	'pt' => 'португалски',
	'qu' => 'кечуа',
	'quc' => 'киче',
	'raj' => 'раджастански',
	'rap' => 'рапа нуи',
	'rar' => 'раротонга',
	'rm' => 'реторомански',
	'rn' => 'рунди',
	'ro' => 'румънски',
	'ro_MD' => 'молдовски',
	'rof' => 'ромбо',
	'rom' => 'ромски',
	'root' => 'роот',
	'ru' => 'руски',
	'rup' => 'арумънски',
	'rw' => 'киняруанда',
	'rwk' => 'рва',
	'sa' => 'санскрит',
	'sad' => 'сандаве',
	'sah' => 'якутски',
	'sam' => 'самаритански арамейски',
	'saq' => 'самбуру',
	'sas' => 'сасак',
	'sat' => 'сантали',
	'sba' => 'нгамбай',
	'sbp' => 'сангу',
	'sc' => 'сардински',
	'scn' => 'сицилиански',
	'sco' => 'шотландски',
	'sd' => 'синдхи',
	'sdh' => 'южнокюрдски',
	'se' => 'северносаамски',
	'seh' => 'сена',
	'sel' => 'селкуп',
	'ses' => 'койраборо сени',
	'sg' => 'санго',
	'sga' => 'староирландски',
	'sh' => 'сърбохърватски',
	'shi' => 'ташелхит',
	'shn' => 'шан',
	'si' => 'синхалски',
	'sid' => 'сидамо',
	'sk' => 'словашки',
	'sl' => 'словенски',
	'sm' => 'самоански',
	'sma' => 'южносаамски',
	'smj' => 'луле-саамски',
	'smn' => 'инари-саамски',
	'sms' => 'сколт-саамски',
	'sn' => 'шона',
	'snk' => 'сонинке',
	'so' => 'сомалийски',
	'sog' => 'согдийски',
	'sq' => 'албански',
	'sr' => 'сръбски',
	'srn' => 'сранан тонго',
	'srr' => 'серер',
	'ss' => 'свати',
	'ssy' => 'сахо',
	'st' => 'сесото',
	'su' => 'сундански',
	'suk' => 'сукума',
	'sus' => 'сусу',
	'sux' => 'шумерски',
	'sv' => 'шведски',
	'sw' => 'суахили',
	'sw_CD' => 'конгоански суахили',
	'swb' => 'коморски',
	'syc' => 'класически сирийски',
	'syr' => 'сирийски',
	'ta' => 'тамилски',
	'te' => 'телугу',
	'tem' => 'темне',
	'teo' => 'тесо',
	'ter' => 'терено',
	'tet' => 'тетум',
	'tg' => 'таджикски',
	'th' => 'тайски',
	'ti' => 'тигриня',
	'tig' => 'тигре',
	'tiv' => 'тив',
	'tk' => 'туркменски',
	'tkl' => 'токелайски',
	'tl' => 'тагалог',
	'tlh' => 'клингонски',
	'tli' => 'тлингит',
	'tmh' => 'тамашек',
	'tn' => 'тсвана',
	'to' => 'тонгански',
	'tog' => 'нианса тонга',
	'tpi' => 'ток писин',
	'tr' => 'турски',
	'trv' => 'тароко',
	'ts' => 'цонга',
	'tsi' => 'цимшиански',
	'tt' => 'татарски',
	'tum' => 'тумбука',
	'tvl' => 'тувалуански',
	'tw' => 'туи',
	'twq' => 'тасавак',
	'ty' => 'таитянски',
	'tyv' => 'тувински',
	'tzm' => 'централноатласки тамазигт',
	'udm' => 'удмуртски',
	'ug' => 'уйгурски',
	'uga' => 'угаритски',
	'uk' => 'украински',
	'umb' => 'умбунду',
	'und' => 'неопределен',
	'ur' => 'урду',
	'uz' => 'узбекски',
	'vai' => 'ваи',
	've' => 'венда',
	'vi' => 'виетнамски',
	'vo' => 'волапюк',
	'vot' => 'вотик',
	'vun' => 'вунджо',
	'wa' => 'валонски',
	'wae' => 'валзерски немски',
	'wal' => 'валамо',
	'war' => 'варай',
	'was' => 'уашо',
	'wbp' => 'валпири',
	'wo' => 'волоф',
	'xal' => 'калмик',
	'xh' => 'ксоса',
	'xog' => 'сога',
	'yao' => 'яо',
	'yap' => 'япезе',
	'yav' => 'янгбен',
	'ybb' => 'йемба',
	'yi' => 'идиш',
	'yo' => 'йоруба',
	'yue' => 'кантонски',
	'za' => 'зуанг',
	'zap' => 'запотек',
	'zbl' => 'блис символи',
	'zen' => 'зенага',
	'zgh' => 'стандартен марокански тамазигт',
	'zh' => 'китайски',
	'zh_Hans' => 'китайски (опростен)',
	'zu' => 'зулуски',
	'zun' => 'зуни',
	'zxx' => 'без лингвистично съдържание',
	'zza' => 'заза',
};

is_deeply($locale->all_languages, $all_languages, 'All languages');

is($locale->script_name(), '', 'Script name from current locale');
is($locale->script_name('latn'), 'латиница', 'Script name from string');
is($locale->script_name($other_locale), '', 'Script name from other locale object');

my $all_scripts = {
	'Arab' => 'арабска',
	'Arab@alt=variant' => 'персийско-арабска',
	'Armi' => 'Арамейска',
	'Armn' => 'арменска',
	'Avst' => 'Авестанска',
	'Bali' => 'Балийски',
	'Batk' => 'Батакска',
	'Beng' => 'бенгалска',
	'Blis' => 'Блис символи',
	'Bopo' => 'бопомофо',
	'Brah' => 'Брахми',
	'Brai' => 'Брайлова',
	'Bugi' => 'Бугинска',
	'Buhd' => 'Бухид',
	'Cakm' => 'Чакма',
	'Cans' => 'Унифицирани символи на канадски аборигени',
	'Cari' => 'Карийска',
	'Cham' => 'Хамитска',
	'Cher' => 'Чероки',
	'Cirt' => 'Кирт',
	'Copt' => 'Коптска',
	'Cprt' => 'Кипърска',
	'Cyrl' => 'кирилица',
	'Cyrs' => 'Стар църковно-славянски вариант Кирилица',
	'Deva' => 'деванагари',
	'Dsrt' => 'Дезерет',
	'Egyd' => 'Египетско демотично писмо',
	'Egyh' => 'Египетско йератично писмо',
	'Egyp' => 'Египетски йероглифи',
	'Ethi' => 'етиопска',
	'Geok' => 'Грузинска хуцури',
	'Geor' => 'грузинска',
	'Glag' => 'Глаголическа',
	'Goth' => 'Готическа',
	'Grek' => 'гръцка',
	'Gujr' => 'гуджарати',
	'Guru' => 'гурмукхи',
	'Hanb' => 'ханб',
	'Hang' => 'хангъл',
	'Hani' => 'китайска',
	'Hano' => 'Хануну',
	'Hans' => 'опростена',
	'Hans@alt=stand-alone' => 'опростен китайски',
	'Hant' => 'традиционен',
	'Hant@alt=stand-alone' => 'традиционен китайски',
	'Hebr' => 'иврит',
	'Hira' => 'хирагана',
	'Hmng' => 'Пахау хмонг',
	'Hrkt' => 'японска сричкова',
	'Hung' => 'Староунгарска',
	'Inds' => 'Харапска',
	'Ital' => 'Древно италийска',
	'Jamo' => 'джамо',
	'Java' => 'Яванска',
	'Jpan' => 'японска',
	'Kali' => 'Кая Ли',
	'Kana' => 'катакана',
	'Khar' => 'Кхароштхи',
	'Khmr' => 'кхмерска',
	'Knda' => 'каннада',
	'Kore' => 'корейска',
	'Kthi' => 'Кайтхи',
	'Lana' => 'Ланна',
	'Laoo' => 'лаоска',
	'Latf' => 'Латинска фрактура',
	'Latg' => 'Галска латинска',
	'Latn' => 'латиница',
	'Lepc' => 'Лепча',
	'Limb' => 'Лимбу',
	'Lina' => 'Линейна А',
	'Linb' => 'Линейна Б',
	'Lyci' => 'Лицийска',
	'Lydi' => 'Лидийска',
	'Mand' => 'Мандаринска',
	'Mani' => 'Манихейска',
	'Maya' => 'Йероглифи на Маите',
	'Mero' => 'Мероитска',
	'Mlym' => 'малаялам',
	'Mong' => 'монголска',
	'Moon' => 'Мун',
	'Mtei' => 'Манипури',
	'Mymr' => 'бирманска',
	'Nkoo' => 'Н’Ко',
	'Ogam' => 'Огамическа',
	'Olck' => 'Ол Чики',
	'Orkh' => 'Орхоно-енисейска',
	'Orya' => 'ория',
	'Osma' => 'Османска',
	'Perm' => 'Древно пермска',
	'Phag' => 'Фагс-па',
	'Phlv' => 'Пахлавска',
	'Phnx' => 'Финикийска',
	'Plrd' => 'Писменост Полард',
	'Roro' => 'Ронго-ронго',
	'Runr' => 'Руническа',
	'Samr' => 'Самаританска',
	'Sara' => 'Сарати',
	'Saur' => 'Саураштра',
	'Sinh' => 'синхалска',
	'Sund' => 'Сунданска',
	'Sylo' => 'Силоти Нагри',
	'Syrc' => 'Сирийска',
	'Syre' => 'Сирийска естрангело',
	'Syrj' => 'Западна сирийска',
	'Syrn' => 'Източна сирийска',
	'Tagb' => 'Тагбанва',
	'Tale' => 'Тай Ле',
	'Talu' => 'Нова Тай Ле',
	'Taml' => 'тамилска',
	'Telu' => 'телугу',
	'Tglg' => 'Тагалог',
	'Thaa' => 'таана',
	'Thai' => 'тайска',
	'Tibt' => 'тибетска',
	'Ugar' => 'Угаритска',
	'Vaii' => 'Вайска',
	'Visp' => 'Видима реч',
	'Xpeo' => 'Староперсийска',
	'Xsux' => 'Шумеро-акадски клинопис',
	'Yiii' => 'Йи',
	'Zmth' => 'Математически символи',
	'Zsye' => 'емотикони',
	'Zsym' => 'символи',
	'Zxxx' => 'без писменост',
	'Zyyy' => 'обща',
	'Zzzz' => 'непозната писменост',
};

is_deeply($locale->all_scripts, $all_scripts, 'All scripts');

is($locale->region_name(), '', 'Region name from current locale');
is($locale->region_name('fr'), 'Франция', 'Region name from string');
is($locale->region_name($other_locale), 'Съединени щати', 'Region name from other locale object');

my $all_regions = {
	'001' => 'Свят',
	'002' => 'Африка',
	'003' => 'Северноамерикански континент',
	'005' => 'Южна Америка',
	'009' => 'Океания',
	'011' => 'Западна Афирка',
	'013' => 'Централна Америка',
	'014' => 'Източна Африка',
	'015' => 'Северна Африка',
	'017' => 'Централна Африка',
	'018' => 'Южноафрикански регион',
	'019' => 'Америка',
	'021' => 'Северна Америка',
	'029' => 'Карибски регион',
	'030' => 'Източна Азия',
	'034' => 'Южна Азия',
	'035' => 'Югоизточна Азия',
	'039' => 'Южна Европа',
	'053' => 'Австралазия',
	'054' => 'Меланезия',
	'057' => 'Микронезийски регион',
	'061' => 'Полинезия',
	'142' => 'Азия',
	'143' => 'Централна Азия',
	'145' => 'Западна Азия',
	'150' => 'Европа',
	'151' => 'Източна Европа',
	'154' => 'Северна Европа',
	'155' => 'Западна Европа',
	'419' => 'Латинска Америка',
	'AC' => 'остров Възнесение',
	'AD' => 'Андора',
	'AE' => 'Обединени арабски емирства',
	'AF' => 'Афганистан',
	'AG' => 'Антигуа и Барбуда',
	'AI' => 'Ангуила',
	'AL' => 'Албания',
	'AM' => 'Армения',
	'AO' => 'Ангола',
	'AQ' => 'Антарктика',
	'AR' => 'Аржентина',
	'AS' => 'Американска Самоа',
	'AT' => 'Австрия',
	'AU' => 'Австралия',
	'AW' => 'Аруба',
	'AX' => 'Оландски острови',
	'AZ' => 'Азербайджан',
	'BA' => 'Босна и Херцеговина',
	'BB' => 'Барбадос',
	'BD' => 'Бангладеш',
	'BE' => 'Белгия',
	'BF' => 'Буркина Фасо',
	'BG' => 'България',
	'BH' => 'Бахрейн',
	'BI' => 'Бурунди',
	'BJ' => 'Бенин',
	'BL' => 'Сен Бартелеми',
	'BM' => 'Бермудски острови',
	'BN' => 'Бруней Даруссалам',
	'BO' => 'Боливия',
	'BQ' => 'Карибска Нидерландия',
	'BR' => 'Бразилия',
	'BS' => 'Бахами',
	'BT' => 'Бутан',
	'BV' => 'остров Буве',
	'BW' => 'Ботсвана',
	'BY' => 'Беларус',
	'BZ' => 'Белиз',
	'CA' => 'Канада',
	'CC' => 'Кокосови острови (острови Кийлинг)',
	'CD' => 'Конго (Киншаса)',
	'CD@alt=variant' => 'Конго (ДРК)',
	'CF' => 'Централноафриканска република',
	'CG' => 'Конго (Бразавил)',
	'CG@alt=variant' => 'Конго (Република)',
	'CH' => 'Швейцария',
	'CI' => 'Кот д’Ивоар',
	'CI@alt=variant' => 'Бряг на слоновата кост',
	'CK' => 'острови Кук',
	'CL' => 'Чили',
	'CM' => 'Камерун',
	'CN' => 'Китай',
	'CO' => 'Колумбия',
	'CP' => 'остров Клипертон',
	'CR' => 'Коста Рика',
	'CU' => 'Куба',
	'CV' => 'Кабо Верде',
	'CW' => 'Кюрасао',
	'CX' => 'остров Рождество',
	'CY' => 'Кипър',
	'CZ' => 'Чехия',
	'CZ@alt=variant' => 'Чешка република',
	'DE' => 'Германия',
	'DG' => 'Диего Гарсия',
	'DJ' => 'Джибути',
	'DK' => 'Дания',
	'DM' => 'Доминика',
	'DO' => 'Доминиканска република',
	'DZ' => 'Алжир',
	'EA' => 'Сеута и Мелия',
	'EC' => 'Еквадор',
	'EE' => 'Естония',
	'EG' => 'Египет',
	'EH' => 'Западна Сахара',
	'ER' => 'Еритрея',
	'ES' => 'Испания',
	'ET' => 'Етиопия',
	'EU' => 'Европейски съюз',
	'EZ' => 'Еврозона',
	'FI' => 'Финландия',
	'FJ' => 'Фиджи',
	'FK' => 'Фолклендски острови',
	'FK@alt=variant' => 'Фолклендски острови (Малвински острови)',
	'FM' => 'Микронезия',
	'FO' => 'Фарьорски острови',
	'FR' => 'Франция',
	'GA' => 'Габон',
	'GB' => 'Обединеното кралство',
	'GB@alt=short' => 'Обединеното кралство',
	'GD' => 'Гренада',
	'GE' => 'Грузия',
	'GF' => 'Френска Гвиана',
	'GG' => 'Гърнзи',
	'GH' => 'Гана',
	'GI' => 'Гибралтар',
	'GL' => 'Гренландия',
	'GM' => 'Гамбия',
	'GN' => 'Гвинея',
	'GP' => 'Гваделупа',
	'GQ' => 'Екваториална Гвинея',
	'GR' => 'Гърция',
	'GS' => 'Южна Джорджия и Южни Сандвичеви острови',
	'GT' => 'Гватемала',
	'GU' => 'Гуам',
	'GW' => 'Гвинея-Бисау',
	'GY' => 'Гаяна',
	'HK' => 'Хонконг, САР на Китай',
	'HK@alt=short' => 'Хонконг',
	'HM' => 'острови Хърд и Макдоналд',
	'HN' => 'Хондурас',
	'HR' => 'Хърватия',
	'HT' => 'Хаити',
	'HU' => 'Унгария',
	'IC' => 'Канарски острови',
	'ID' => 'Индонезия',
	'IE' => 'Ирландия',
	'IL' => 'Израел',
	'IM' => 'остров Ман',
	'IN' => 'Индия',
	'IO' => 'Британска територия в Индийския океан',
	'IQ' => 'Ирак',
	'IR' => 'Иран',
	'IS' => 'Исландия',
	'IT' => 'Италия',
	'JE' => 'Джърси',
	'JM' => 'Ямайка',
	'JO' => 'Йордания',
	'JP' => 'Япония',
	'KE' => 'Кения',
	'KG' => 'Киргизстан',
	'KH' => 'Камбоджа',
	'KI' => 'Кирибати',
	'KM' => 'Коморски острови',
	'KN' => 'Сейнт Китс и Невис',
	'KP' => 'Северна Корея',
	'KR' => 'Южна Корея',
	'KW' => 'Кувейт',
	'KY' => 'Кайманови острови',
	'KZ' => 'Казахстан',
	'LA' => 'Лаос',
	'LB' => 'Ливан',
	'LC' => 'Сейнт Лусия',
	'LI' => 'Лихтенщайн',
	'LK' => 'Шри Ланка',
	'LR' => 'Либерия',
	'LS' => 'Лесото',
	'LT' => 'Литва',
	'LU' => 'Люксембург',
	'LV' => 'Латвия',
	'LY' => 'Либия',
	'MA' => 'Мароко',
	'MC' => 'Монако',
	'MD' => 'Молдова',
	'ME' => 'Черна гора',
	'MF' => 'Сен Мартен',
	'MG' => 'Мадагаскар',
	'MH' => 'Маршалови острови',
	'MK' => 'Македония',
	'MK@alt=variant' => 'Бивша югославска република Македония',
	'ML' => 'Мали',
	'MM' => 'Мианмар (Бирма)',
	'MN' => 'Монголия',
	'MO' => 'Макао, САР на Китай',
	'MO@alt=short' => 'Макао',
	'MP' => 'Северни Мариански острови',
	'MQ' => 'Мартиника',
	'MR' => 'Мавритания',
	'MS' => 'Монтсерат',
	'MT' => 'Малта',
	'MU' => 'Мавриций',
	'MV' => 'Малдиви',
	'MW' => 'Малави',
	'MX' => 'Мексико',
	'MY' => 'Малайзия',
	'MZ' => 'Мозамбик',
	'NA' => 'Намибия',
	'NC' => 'Нова Каледония',
	'NE' => 'Нигер',
	'NF' => 'остров Норфолк',
	'NG' => 'Нигерия',
	'NI' => 'Никарагуа',
	'NL' => 'Нидерландия',
	'NO' => 'Норвегия',
	'NP' => 'Непал',
	'NR' => 'Науру',
	'NU' => 'Ниуе',
	'NZ' => 'Нова Зеландия',
	'OM' => 'Оман',
	'PA' => 'Панама',
	'PE' => 'Перу',
	'PF' => 'Френска Полинезия',
	'PG' => 'Папуа-Нова Гвинея',
	'PH' => 'Филипини',
	'PK' => 'Пакистан',
	'PL' => 'Полша',
	'PM' => 'Сен Пиер и Микелон',
	'PN' => 'Острови Питкерн',
	'PR' => 'Пуерто Рико',
	'PS' => 'Палестински територии',
	'PS@alt=short' => 'Палестина',
	'PT' => 'Португалия',
	'PW' => 'Палау',
	'PY' => 'Парагвай',
	'QA' => 'Катар',
	'QO' => 'Отдалечени острови на Океания',
	'RE' => 'Реюнион',
	'RO' => 'Румъния',
	'RS' => 'Сърбия',
	'RU' => 'Русия',
	'RW' => 'Руанда',
	'SA' => 'Саудитска Арабия',
	'SB' => 'Соломонови острови',
	'SC' => 'Сейшели',
	'SD' => 'Судан',
	'SE' => 'Швеция',
	'SG' => 'Сингапур',
	'SH' => 'Света Елена',
	'SI' => 'Словения',
	'SJ' => 'Свалбард и Ян Майен',
	'SK' => 'Словакия',
	'SL' => 'Сиера Леоне',
	'SM' => 'Сан Марино',
	'SN' => 'Сенегал',
	'SO' => 'Сомалия',
	'SR' => 'Суринам',
	'SS' => 'Южен Судан',
	'ST' => 'Сао Томе и Принсипи',
	'SV' => 'Салвадор',
	'SX' => 'Синт Мартен',
	'SY' => 'Сирия',
	'SZ' => 'Свазиленд',
	'TA' => 'Тристан да Куня',
	'TC' => 'острови Търкс и Кайкос',
	'TD' => 'Чад',
	'TF' => 'Френски южни територии',
	'TG' => 'Того',
	'TH' => 'Тайланд',
	'TJ' => 'Таджикистан',
	'TK' => 'Токелау',
	'TL' => 'Източен Тимор',
	'TM' => 'Туркменистан',
	'TN' => 'Тунис',
	'TO' => 'Тонга',
	'TR' => 'Турция',
	'TT' => 'Тринидад и Тобаго',
	'TV' => 'Тувалу',
	'TW' => 'Тайван',
	'TZ' => 'Танзания',
	'UA' => 'Украйна',
	'UG' => 'Уганда',
	'UM' => 'Отдалечени острови на САЩ',
	'UN' => 'Организация на обединените нации',
	'US' => 'Съединени щати',
	'US@alt=short' => 'САЩ',
	'UY' => 'Уругвай',
	'UZ' => 'Узбекистан',
	'VA' => 'Ватикан',
	'VC' => 'Сейнт Винсънт и Гренадини',
	'VE' => 'Венецуела',
	'VG' => 'Британски Вирджински острови',
	'VI' => 'Американски Вирджински острови',
	'VN' => 'Виетнам',
	'VU' => 'Вануату',
	'WF' => 'Уолис и Футуна',
	'WS' => 'Самоа',
	'XK' => 'Косово',
	'YE' => 'Йемен',
	'YT' => 'Майот',
	'ZA' => 'Южна Африка',
	'ZM' => 'Замбия',
	'ZW' => 'Зимбабве',
	'ZZ' => 'непознат регион',
};

is_deeply($locale->all_regions(), $all_regions, 'All Regions');

is($locale->variant_name(), '', 'Variant name from current locale');
is($locale->variant_name('BISKE'), 'Диалект Сан Джорджио/Била', 'Variant name from string');
is($locale->variant_name($other_locale), '', 'Variant name from other locale object');
is($locale->key_name('colCaseLevel'), 'Сортиране с различаване на регистъра на буквите', 'Key name from string');
is($locale->type_name(colCaseFirst => 'lower'), 'Сортиране първо по долен регистър', 'Type name from string');
is($locale->measurement_system_name('metric'), 'метрична', 'Measurement system name English Metric');
is($locale->measurement_system_name('us'), 'американска', 'Measurement system name English US');
is($locale->measurement_system_name('uk'), 'имперска', 'Measurement system name English UK');

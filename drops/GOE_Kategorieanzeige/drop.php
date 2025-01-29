<?php
/**
 * Kategorieanzeige Drop
 * @docs https://kreativkonzentrat.de/Wiki?page=dropper/dev/php
 * @generator https://kreativkonzentrat.de/Drop-Builder
 */
class GOE_KategorieanzeigeDrop extends DropActions {
	/**
	* Called when the Drop is initialized
	*/
	public function init() {
		$db = JTL\Shop::Container()->getDB();
		$dKategorieListe = array();
		$asd = "%%";
		//$getHersteller = 'SELECT * FROM thersteller WHERE cName LIKE :hn';
		// goe NA 21052024 -  Abfrage angepasst, damit nur Hersteller angezeigt werden, von denen es auch Artikel gibt
		$getKategorie = 'SELECT 
    tkategorie.kKategorie,
    tkategorie.cSeo,
    tkategorie.cName,
    tkategoriepict.kKategoriepict,
    tkategoriepict.cPfad AS tkategoriepict_cPfad,
    tbild.cPfad AS tbild_cPfad
FROM 
    tkategorie
LEFT JOIN 
    tkategoriepict
ON 
    tkategorie.kKategorie = tkategoriepict.kKategorie
LEFT JOIN 
    tbild
ON 
    tkategoriepict.kKategoriepict = tbild.kBild';

		$res = $db->queryPrepared($getKategorie, [], \JTL\DB\ReturnType::ARRAY_OF_OBJECTS);
		$this->drop['kategorieArray'] = $res;
	}
}
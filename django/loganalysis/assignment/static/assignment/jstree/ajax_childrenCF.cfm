<!---
Name:        http://localhost:8500/_pubmed2015/mesh/ajax_childrenCF.cfm
Author:      Dan Wendling (wendlingd@icloud.com)
Description: Record Set Analyzer - Browse records through the MeSH tree
Created:     2/1/2014
Modified:    10/1/2017

Purpose: Load every item in the CF retrieval into a one-off call to eUtils
Then return term + count to jsTree, either one at a time or all at once.

Add a conditional to make V, Publication Formats [Publication Type], work correctly. If treeNumber like V%, switch to [Publication Type].
 --->

<cfsilent>

<cfparam name="URL.id" type="string" default="Humanities">

<!---Other/temp--->

<cfparam name="FORM.encoding" type="string" default="%28%28opioid+OR+opioids%29+AND+%28%222015%2F01%2F01%22%5BPDAT%5D+%3A+%222018%2F06%2F28%22%5BPDAT%5D%29%29">

<!---
nlm%5Bgr%5D
duplicate+publication+%5Bpt%5D+AND+medline%5Bsb%5D
 --->

<!---
NIGMS
<cfparam name="FORM.encoding" type="string" default="nigms%5Bgr%5D%20AND%20%28%222004%2F05%2F25%22%5BPDat%5D%20%3A%20%222014%2F05%2F22%22%5BPDat%5D%29">
 --->


<!---Veterinary medicine subset --->
<!---<cfparam name="FORM.encoding" type="string" default="veterinary%5Bsb%5D">--->

<!---Health disparities --->
<!---<cfparam name="FORM.encoding" type="string" default="%28%28%22delivery+of+health+care%22%5BMeSH+Terms:noexp%5D+OR+%22health+behavior%22%5BMeSH+Terms%5D+OR+%22health+knowledge,+attitudes,+practice%22%5BMeSH+Terms%5D+OR+%22health+services+accessibility%22%5BMeSH+Terms%5D+OR+%22health+services,+indigenous%22%5BMeSH+Terms%5D+OR+%22mass+screening%22%5BMeSH+Terms%5D+OR+mass+screening%5BTIAB%5D+OR+mass+screenings%5BTIAB%5D+OR+health+inequality%5BTIAB%5D+OR+health+inequalities%5BTIAB%5D+OR+health+inequities%5BTIAB%5D+OR+health+inequity%5BTIAB%5D+OR+%22health+services+needs+and+demand%22%5BMeSH+Terms%5D+OR+%22patient+acceptance+of+health+care%22%5BMeSH+Terms%5D+OR+%22patient+selection%22%5BMeSH+Terms%5D+OR+%22quality+of+health+care%22%5BMeSH+Major+Topic:noexp%5D+OR+%22quality+of+life%22%5BMeSH+Terms%5D+OR+quality+of+life%5BTIAB%5D+OR+social+disparities%5BTIAB%5D+OR+social+disparity%5BTIAB%5D+OR+social+inequities%5BTIAB%5D+OR+social+inequity%5BTIAB%5D+OR+%22socioeconomic+factors%22%5BMeSH+Major+Topic%5D+OR+socioeconomic+factor%5BTIAB%5D+OR+socioeconomic+factors%5BTIAB%5D+OR+%22social+determinants+of+health%22%5BMeSH+Terms%5D%29+AND+%28African+American%5BTIAB%5D+OR+African+Americans%5BTIAB%5D+OR+African+ancestry%5BTIAB%5D+OR+%22african+continental+ancestry+group%22%5BMeSH+Terms%5D+OR+AIAN%5BTIAB%5D+OR+%22american+native+continental+ancestry+group%22%5BMeSH+Terms%5D+OR+%22asian+continental+ancestry+group%22%5BMeSH+Terms%5D+OR+Asian%5BTIAB%5D+OR+Asians%5BTIAB%5D+OR+black%5BTIAB%5D+OR+blacks%5BTIAB%5D+OR+Caucasian%5BTIAB%5D+OR+Caucasians%5BTIAB%5D+OR+diverse+population%5BTIAB%5D+OR+diverse+populations%5BTIAB%5D+OR+environmental+justice%5BTIAB%5D+OR+ethnic+group%5BTIAB%5D+OR+%22ethnic+groups%22%5BMeSH+Terms%5D+OR+ethnic+groups%5BTIAB%5D+OR+ethnic+population%5BTIAB%5D+OR+ethnic+populations%5BTIAB%5D+OR+ghetto%5BTIAB%5D+OR+ghettos%5BTIAB%5D+OR+Hispanic%5BTIAB%5D+OR+Hispanics%5BTIAB%5D+OR+Indian%5BTIAB%5D+OR+Indians%5BTIAB%5D+OR+Latino%5BTIAB%5D+OR+Latinos%5BTIAB%5D+OR+Latina%5BTIAB%5D+OR+Latinas%5BTIAB%5D+OR+%22medically+underserved+area%22%5BMeSH+Terms%5D+OR+minority+group%5BTIAB%5D+OR+%22minority+groups%22%5BMeSH+Terms%5D+OR+minority+groups%5BTIAB%5D+OR+minority+population%5BTIAB%5D+OR+minority+populations%5BTIAB%5D+OR+Native+American%5BTIAB%5D+OR+Native+Americans%5BTIAB%5D+OR+%22oceanic+ancestry+group%22%5BMeSH+Terms%5D+OR+pacific+islander%5BTIAB%5D+OR+pacific+islanders%5BTIAB%5D+OR+people+of+color%5BTIAB%5D+OR+%22poverty+areas%22%5BMeSH+Terms%5D+OR+poverty+area%5BTIAB%5D+OR+poverty+areas%5BTIAB%5D+OR+%22rural+health%22%5BMeSH+Terms%5D+OR+rural+health%5BTIAB%5D+OR+%22rural+health+services%22%5BMeSH+Terms%5D+OR+%22rural+population%22%5BMeSH+Terms%5D+OR+rural+population%5BTIAB%5D+OR+rural+populations%5BTIAB%5D+OR+slum%5BTIAB%5D+OR+slums%5BTIAB%5D+OR+%22urban+health%22%5BMeSH+Terms%5D+OR+%22urban+health+services%22%5BMeSH+Terms%5D+OR+%22urban+population%22%5BMeSH+Terms%5D+OR+urban+population%5BTIAB%5D+OR+urban+populations%5BTIAB%5D+OR+%22vulnerable+populations%22%5BMeSH+Terms%5D+OR+vulnerable+population%5BTIAB%5D+OR+vulnerable+populations%5BTIAB%5D+OR+white%5BTIAB%5D+OR+whites%5BTIAB%5D%29+OR+%28ethnic+disparities%5BTIAB%5D+OR+ethnic+disparity%5BTIAB%5D+OR+health+care+disparities%5BTIAB%5D+OR+health+care+disparity%5BTIAB%5D+OR+health+disparities%5BTIAB%5D+OR+health+disparity%5BTIAB%5D+OR+%22health+status+disparities%22%5BMeSH+Terms%5D+OR+%22healthcare+disparities%22%5BMeSH+Terms%5D+OR+healthcare+disparities%5BTIAB%5D+OR+healthcare+disparity%5BTIAB%5D+OR+%22minority+health%22%5BMeSH+Terms%5D+OR+minority+health%5BTIAB%5D+OR+racial+disparities%5BTIAB%5D+OR+racial+disparity%5BTIAB%5D+OR+racial+equality%5BTIAB%5D+OR+racial+equity%5BTIAB%5D+OR+racial+inequities%5BTIAB%5D+OR+racial+inequity%5BTIAB%5D+OR+%22ageism%22%5BMeSH+Terms%5D+OR+%22racism%22%5BMeSH+Terms%5D+OR+%22sexism%22%5BMeSH+Terms%5D+OR+%22social+discrimination%22%5BMeSH+Terms%5D+OR+%22social+marginalization%22%5BMeSH+Terms%5D%29%29">--->

<!--- Health literacy --->
<!---<cfparam name="FORM.encoding" type="string" default="%28%28%28comprehension%5Ball+fields%5D+AND+english%5Bla%5D%29+AND+%28compliance+OR+adherence%29%29+OR+%28health%5Bti%5D+AND+literacy%5Bti%5D%29+OR+%28%22health+literacy%22+OR+%22health+literate%22+OR+%22medical+literacy%22%29+OR+%28functional%5Btw%5D+AND+health%5Btw%5D+AND+literacy%5Btw%5D%29+OR+numeracy+OR+%28%28low+literate%5Bti%5D+OR+low+literacy%5Bti%5D+OR+literacy%5Bti%5D+OR+illiteracy%5Bti%5D+OR+literate%5Bti%5D+OR+illiterate%5Bti%5D+OR+reading%5Bmh%5D+OR+comprehension%5Bmh%5D%29+AND+%28health+promotion%5Bmajor%5D+OR+health+education%5Bmajor%5D+OR+patient+education%5Bmajor%5D+OR+Communication+Barriers%5Bmajor%5D+OR+communication%5Bmajor%3Anoexp%5D+OR+Health+Knowledge%2C+Attitudes%2C+Practice%5Bmajor%5D+OR+attitude+to+health%5Bmajor%5D%29%29+OR+%28comprehension%5Bmajor%5D+AND+educational+status%5Bmajor%5D%29+OR+%28family%5Bti%5D+AND+literacy%5Bti%5D%29+OR+%28%28%22drug+labeling%22+OR+Prescriptions+%5Bmh%5D%29+AND+%28%22comprehension%22+OR+%22numeracy%22%29%29+OR+%28%28cancer%5Bti%5D+OR+diabetes%5Bti%5D%29+AND+%28literacy%5Bti%5D+OR+comprehension%5Bti%5D%29%29+OR+%22adult+literacy%22+OR+%22limited+literacy%22+OR+%22patient+understanding%22%5Bti%5D+OR+%28self+care+%5Bmajor%5D+AND+perception%5Bmh%5D%29+OR+%28comprehension+AND+food+labeling%5Bmh%5D%29+AND+English%5Bla%5D%29">--->

<!---Get the list of child nodes from the database--->
<cfquery name="cfDescriptor" datasource="pubmed">
    select distinct DescriptorName, leafNodeYN, fieldTag
    from mesh_tree
    where parentName like '#id#'
    order by DescriptorName
</cfquery>
<!---Add treeNumber to select and title="#treeNumber#" to li if you need to troubleshoot--->


<!---Create a variable to account for whether your search will be [mh] or [Publication Type]--->



<!--- Create an array> --->
<cfset resultArray = ArrayNew(1)>

<!--- Loop through the query; append these names successively to the last
    element. --->
<cfloop query = "cfDescriptor">

    <cfhttp url="http://eutils.ncbi.nlm.nih.gov/entrez/eutils/esearch.fcgi?db=pubmed&term=#cfDescriptor.DescriptorName#%5B#fieldTag#%5D+AND+#encoding#&rettype=count&tool=rsaMeSH&email=d_wendling@yahoo.com" method="get" />

    <!---Make the XML available--->
    <cfset xmlObject = xmlParse(cfhttp.FileContent)>

    <cfif structKeyExists(xmlObject["eSearchResult"], "Count")>
        <cfset recCnt = #xmlObject["eSearchResult"]["Count"].XmlText#>
    </cfif>


    <!---Set icon for parent or leaf node--->
    <cfif trim(leafNodeYN) is "N">
	    <cfset iconAppearance = "class=""jstree-closed""">
    <cfelse>
	    <cfset iconAppearance = "data-jstree=''{""icon"":""glyphicon glyphicon-leaf""}''">
    </cfif>

    <!---Add this row to array--->
        <cfoutput>#ArrayAppend(resultArray, '<li #iconAppearance# id="#DescriptorName#">#DescriptorName# (#recCnt#)</li>')#
        </cfoutput>
</cfloop>

<!--- Show the resulting array as a list. --->
<cfset resultList = ArrayToList(resultArray, " ")>
</cfsilent>

<!--- Output the array as a list. --->
<cfoutput><ul>#resultList#</ul></cfoutput>
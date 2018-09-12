# Semantic-search-log-analysis Pipeline (SSLAP)
# Touchpoint analysis for web visitors: Site search

The logs for internal search for large biomedical web sites can be too verbose and too inharmonious to make sense of. Logs for one NIH site contains more than 200,000 queries per month, with many variations on the same conceptual ideas. Aggregating log entries such as "ObamaCare" and "ACA" and "Affordable Care Act," for example, is far too difficult for a human to parse and take action on. This leads to several missed opportunities in communication management 

Product managers and others COULD BE using this data to understand the environment and their customers better, and improve their web sites, but without automation, the amount of human effort required has not been worth the return on the investment. If there were a way to automatically unite queries that are similar but not the same, under broader topics that could be effectively aggregated and compared over time, then we could more easily explore patterns in the vast amount of data generated, and begin to interpret their meaning.

## Goals/Scope 

Four benefits of analyzing site search - we will be able to:

1. **Locate and fix site areas where there is a communications mismatch.** When we don’t provide the information that customers had expected, as evidenced by an outsized number of people searching for things that aren't near to the page where they were searching from, we should change the visibility of that content. We could move its search engine optimization (SEO) profile upward or downward as appropriate. This might involve updating the top navigation, the page-level sub-navigation, the page metadata, various content labeling such as headings, or by updating the subject content of the page(s). In some cases retirement of the content might be the appropriate response. Lastly, as recommended by usability and plain language expert Ginny Redish, we should put our site customers' words into our page headings. "The headings in your web content must resonate with your site customers."
2. **Improve our search interface.** This analysis might help us locate terms that need to be added to the search autocomplete. Or, it could help us improve the search results interface.
3. **Cluster and analyze trends that we know about.** For multi-faceted topics that directly relate to our mission, we could create customized analyses using Python to collect the disparate keywords people might search for, into a single "bucket." Where in the site is there interest in various facets of this subject? Analyzing a trend can show us new constellations of resources that we may not be treating as related. If we were to select a constellation topic such as "opioids" as a topic of study, our bucket might include terms around Fentanyl, heroin, drug treatment, overdose, emergency medicine, etc.), and we could then look at where this person should be in our site, and change the site to help them get there.
4. **Focus staff work onto new trends, as the trends emerge.** When something new starts to happen that can be matched to our mission statement, we can start new content projects to address the emerging need.


## Pipeline

Whole project view.

9/12/2018: Pieces not completed have a dotted border.

![Contact Dan for assistance](searchLogAnalysisPipeline.png "Pipeline")

##Future Directions
1. Collapse SPECIALIST LEXICON into a dictionary to be ingested by Hunspell to create better spellchecking to match with search terms
2. 

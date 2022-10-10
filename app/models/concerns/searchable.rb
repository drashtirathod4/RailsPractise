module Searchable
    extend ActiveSupport::Concern

    included do
        include Elasticsearch::Model
        include Elasticsearch::Model::Callbacks

        mapping do
            indexes :name, type: :text
            indexes :email, type: :text
        end

        def self.search(query, course = nil)
            # leaf query clause
            # modifying search method to search only for name field
            # params = {
            #     query: {
            #         match: {
            #             name: query
            #         },
            #     },
            #     highlight: { 
            #         pre_tags: ["<mark>"],
            #         post_tags: ["</mark>"],
            #         fields: { name: { type: "plain" }, email: { type:"plain" }, course: { type: "plain" } } 
            #     }
            # }

            # multi-match query
            # to query multiple fields
            # params = {
            #     query: {
            #         multi_match: {
            #             query: query, 
            #             fields: [ :name, :email, :course ] 
            #         },
            #     },
            #     highlight: { fields: { name: {}, email: {}, course: {} } }
            # }

            # compound query clause
            # filter by course
            # params = {
            #     query: {
            #         bool: {
            #             must: [
            #             {
            #                 multi_match: {
            #                     query: query, 
            #                     fields: [ :name, :email, :course ] 
            #                 }
            #             },
            #             ],
            #             filter: [
            #             {
            #                 # term query
            #                 term: { course: "ror" }
            #             }
            #             ]              
            #         }
            #     }
            # }

            # scoring
            # boost is a coefficient that multiplies the score from the particular query
            # fuzziness - ES will be less picky and allow fuzzy search
            params = {
                query: {
                    bool: {
                        should: [
                            { match: { name: { query: query, fuzziness: "auto" } }},
                            { match: { email: { query: query, boost: 5} }},
                            { match: { course: query }},
                        ],
                    }
                },
                highlight: { fields: { name: {}, email: {}, course: {} } }
            }

            search_definition = {
                'name-suggest' => {
                    text: query,
                    completion: {
                        field: 'suggest'
                    }
                }
            }

            self.__elasticsearch__.search(params)
            # self.__elasticsearch__.client.perform_request('GET', "#{index_name}/_suggest", {}, )
        end
    end
end

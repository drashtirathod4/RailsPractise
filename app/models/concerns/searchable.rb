module Searchable
    extend ActiveSupport::Concern

    included do
        include Elasticsearch::Model
        include Elasticsearch::Model::Callbacks

        mapping do
            indexes :name, type: :text, analyzer: 'english'
            indexes :email, type: :text, analyzer: 'english'
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
            #         fields: { name: {}, email: {}, course: {} } 
            #     }
            # }

            # multi-match query
            # to query multiple fields
            # ^10 boosts by the 10 th score of hits when the search term is matched in the course
            # params = {
            #     query: {
            #         multi_match: {
            #             query: query, 
            #             fields: [ 'name', 'email', 'course^10' ] 
            #         },
            #     },
            #     highlight: { 
            #         pre_tags: ['<mark>'],
            #         post_tags: ['</mark'],
            #         fields: { name: {}, email: {}, course: {} } 
            #     }
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
            #                 {
            #                     # term query
            #                     term: { course: "ror" }
            #                 }
            #             ]              
            #         }
            #     }
            # }

            # scoring
            # boost is a coefficient that multiplies the score from the particular query
            # fuzziness - ES will be less picky and allow fuzzy search
            # params = {
            #     query: {
            #         bool: {
            #             should: [
            #                 { match: { name: { query: query, fuzziness: "auto" } }},
            #                 { match: { email: { query: query, boost: 5} }},
            #                 { match: { course: query }},
            #             ],
            #         }
            #     },
            #     highlight: {
            #         pre_tags: ['<mark>'],
            #         post_tags: ['</mark>'],
            #         fields: {
            #             name: {},
            #             email: {},
            #             course: {}
            #         }
            #     }
            # }

            # prefix query
            # find all the documents where we have prefix ab
            # params = {
            #     query: {
            #         prefix: {
            #             name: 'ab'
            #         }
            #     }
            # }

            # wildcard query
            # * represents wildcard which can match either zero or more than zero characters
            # params = {
            #     query: {
            #         wildcard: {
            #             name: '*a*'
            #         }
            #     }
            # }

            # regexp query
            # find for all strings that have 'eh' in between
            # params = {
            #     query: {
            #         regexp: {
            #             name: '.*eh.*'
            #         }
            #     }
            # }

            # range query
            # returns documents where the age field contains a term between 10 and 20
            # params = {
            #     query: {
            #         range: {
            #             age: {
            #                 gte: 10,
            #                 lte: 20,
            #                 boost: 2
            #             }
            #         }
            #     }
            # }

            # filter by age with range query
            params = {
                query: {
                    bool: {
                        must: [
                        {
                            multi_match: {
                                query: query, 
                                fields: [ :name, :email, :course ] 
                            }
                        },
                        ],
                        filter: [
                            {
                                # range query
                                range: { age: { gte: 5, lt: 22 } }
                            }
                        ]              
                    }
                }
            }

            self.__elasticsearch__.search(params)
        end
    end
end

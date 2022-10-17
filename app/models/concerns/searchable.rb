module Searchable
    extend ActiveSupport::Concern

    included do
        include Elasticsearch::Model
        include Elasticsearch::Model::Callbacks

        mapping do
            indexes :name, type: :text
            indexes :email, type: :text
            indexes :course, type: :text
            indexes :age, type: :keyword
            indexes :vehicle, type: :nested do
                indexes :name, type: :text, store: true
                indexes :level, type: :text, store: true
            end
        end

        def self.search(query, course = nil)
            # leaf query clause with pagination
            # from to define from which index the results are returned
            # size to define the size of results to return
            # to see next results make changes in from parameter and define the next index's number there
            # -----> modifying search method to search only for name field
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
            #     },
            #     size: 2,
            #     from: 0
            #     # from: 2  # to see next results
            # }

            # search_after
            # specify search_after parameter to tell elastic search to search after specific value
            params = {
                size: 2,
                query: {
                    match: {
                        name: query
                    },
                },
                highlight: { 
                    pre_tags: ["<mark>"],
                    post_tags: ["</mark>"],
                    fields: { name: {}, email: {}, course: {} } 
                },
                # search_after: [19], # to search next results after the age value of 19
                # sort can be used with keyword fields only 
                # for text field we can do "name.keyword" for example.
                sort: [
                    {age: "asc"}  
                ]
            }

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
            #                     # range query
            #                     range: { age: { gte: 5, lt: 22 } }
            #                 }
            #             ]              
            #         }
            #     }
            # }

            # nested query
            # params = {
            #     query: {
            #         nested: {
            #             path: "vehicle",
            #             query: {
            #                 match: {
            #                     "vehicle.level": "beginner"
            #                 }
            #             },
            #             inner_hits: {}
            #         }
            #     }
            # }

            # params = {
            #     query: {
            #         bool: {
            #             must: [
            #                 {
            #                     nested: {
            #                         path: "vehicle",
            #                         query: {
            #                             bool: {
            #                                 must: {
            #                                     match: {
            #                                         "name.text": "car"
            #                                     }
            #                                 }
            #                             }
            #                         }
            #                     }
            #                 }
            #             ]
            #         }
            #     }
            # }

            self.__elasticsearch__.search(params)
        end
    end
end

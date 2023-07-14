/*
 * Copyright 2014-present Alibaba Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#ifndef ISEARCH_EXPRESSION_MULTILAYERBOTTOMUPEVALUATOR_H
#define ISEARCH_EXPRESSION_MULTILAYERBOTTOMUPEVALUATOR_H

#include "matchdoc/MatchDoc.h"
#include "matchdoc/SubDocAccessor.h"
#include "expression/common.h"

namespace expression {
class AttributeExpression;
class BottomUpEvaluator;
typedef std::shared_ptr<BottomUpEvaluator> BottomUpEvaluatorPtr;

class MultiLayerBottomUpEvaluator
{
public:
    MultiLayerBottomUpEvaluator();
    ~MultiLayerBottomUpEvaluator();
private:
    MultiLayerBottomUpEvaluator(const MultiLayerBottomUpEvaluator &);
    MultiLayerBottomUpEvaluator& operator=(const MultiLayerBottomUpEvaluator &);

private:
    typedef std::vector<AttributeExpression*> AttributeExpressionVec;
public:
    void init(const std::vector<AttributeExpressionVec>& expressionLayers,
              matchdoc::SubDocAccessor *subDocAccessor);
    void evaluate(matchdoc::MatchDoc matchDoc);
    void batchEvaluate(matchdoc::MatchDoc *matchDocs, uint32_t docCount);    

private:    
    std::vector<BottomUpEvaluatorPtr> _evaluators;
    
private:
    AUTIL_LOG_DECLARE();
};

}

#endif //ISEARCH_EXPRESSION_MULTILAYERBOTTOMUPEVALUATOR_H

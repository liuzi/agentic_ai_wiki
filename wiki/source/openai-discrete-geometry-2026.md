---
type: source
source_kind: blog
date: 2026-05-29
authors: [openai-team]
venue: openai-blog
status: read
confidence: high
---

**Citation:** OpenAI Team. "An OpenAI model has disproved a central conjecture in discrete geometry." OpenAI Blog, 2026. [URL](https://openai.com/index/model-disproves-discrete-geometry-conjecture/) | [Local copy](../../raw/2026/openai/An%20OpenAI%20model%20has%20disproved%20a%20central%20conjecture%20in%20discrete%20geometry.md)

**Claim:** An OpenAI general-purpose reasoning model autonomously solved the 80-year-old Erdős unit distance problem, disproving the longstanding conjecture that the maximum number of unit-distance pairs among n points in the plane is n^{1+o(1)}.

**Method:** The model was evaluated on a collection of Erdős problems as part of testing whether advanced models can contribute to frontier research. The proof uses sophisticated techniques from algebraic number theory, specifically infinite class field towers and Golod-Shafarevich theory, to construct configurations with polynomial improvement over previously known constructions.

**Results:** 
- Disproved conjecture that square grid constructions were essentially optimal
- Achieved n^{1+δ} unit-distance pairs for δ=0.014 (per Will Sawin's refinement)
- Test-time compute scaling: 0% success at 1x → 48% success at 16x compute
- External mathematicians verified the proof independently

**What's new:** This marks the first time a prominent open mathematical problem has been solved autonomously by AI. The solution brought unexpected connections between algebraic number theory and discrete geometry that surprised experts. The model was general-purpose, not trained specifically for mathematics.

**What I'd push on:** The blog post doesn't provide the explicit δ value from the original AI proof (only Sawin's refinement). The chain of thought document is "abridged" - would be valuable to see the full reasoning process. No details on the model architecture or training beyond "internal OpenAI model."

**Touches:** Links to test-time compute scaling, AI mathematical discovery capabilities, cross-domain knowledge transfer, and frontier research automation.
---
title: "An OpenAI model has disproved a central conjecture in discrete geometry"
source: "https://openai.com/index/model-disproves-discrete-geometry-conjecture/"
author:
published: 2026-05-29
created: 2026-06-01
description: "An OpenAI model solved the 80-year-old unit distance problem, disproving a major conjecture in discrete geometry and marking a milestone in AI-driven mathematics."
tags:
  - "llm_math"
---
For nearly 80 years, mathematicians have studied a deceptively simple question: if you place $n$ points in the plane, how many pairs of points can be exactly distance $1$ apart?

This is the planar unit distance problem, first posed by Paul Erdős in 1946. It is one of the best-known questions in combinatorial geometry, easy to state and remarkably difficult to resolve. The 2005 book *Research Problems in Discrete Geometry*, by Brass, Moser, and Pach, calls it “possibly the best known (and simplest to explain) problem in combinatorial geometry.” Noga Alon, a leading combinatorialist at Princeton, describes it as “one of Erdős’ favorite problems.” Erdős even offered a monetary prize for resolving this problem.

Today, we share a breakthrough on the unit distance problem. Since Erdős’s original work, the prevailing belief has been that the “square grid” constructions depicted further below were essentially optimal for maximizing the number of unit-distance pairs. An internal OpenAI model has disproved this longstanding conjecture, providing an infinite family of examples that yield a polynomial improvement. The proof has been checked by a group of external mathematicians. They have also written a companion paper explaining the argument and providing further background and context for the significance of the result.

The result is also notable for how it was found. The proof came from a new general-purpose reasoning model, rather than from a system trained specifically for mathematics, scaffolded to search through proof strategies, or targeted at the unit distance problem in particular. As part of a broader effort to test whether advanced models can contribute to frontier research, we evaluated it on a collection of Erdős problems. In this case, it produced a proof resolving the open problem.

This proof is an important milestone for the math and AI communities. It marks the first time that a prominent open problem, central to a subfield of mathematics, has been solved autonomously by AI. It also demonstrates the depth of reasoning these systems now support. Mathematics provides a particularly clear testbed for reasoning: the problems are precise, potential proofs can be checked, and a long argument only works if the reasoning holds together from beginning to end. The method by which the problem was solved is also notable. The proof brings unexpected, sophisticated ideas from algebraic number theory to bear on an elementary geometric question.

Fields medalist Tim Gowers, writing in the companion paper, calls the result “a milestone in AI mathematics.” According to leading number theorist Arul Shankar, “In my opinion this paper demonstrates that current AI models go beyond just helpers to human mathematicians – they are capable of having original ingenious ideas, and then carrying them out to fruition”.

Mathematicians on the result

1 of 4

> “This has been one of Erdős' favorite problems, I have heard him myself mentioning the problem multiple times in his lectures. I believe it would be fair to say that every mathematician working in Combinatorial Geometry thought about this problem, and lots of mathematicians working in other areas spent at least some time thinking about it… The solution of the problem by the internal model of Open AI is, in my opinion, an outstanding achievement, settling a long-standing open problem. The fact that the correct answer is not $n^{1+o(1)}$ is surprising, and the construction and its analysis apply fairly sophisticated tools from algebraic number theory in an elegant and clever way.”

Noga Alon

- Noga Alon
- Tim Gowers
- Arul Shankar
- Jacob Tsimerman

The proof is available [here⁠](https://cdn.openai.com/pdf/74c24085-19b0-4534-9c90-465b8e29ad73/unit-distance-proof.pdf). The companion paper by leading external mathematicians is available [here⁠](https://cdn.openai.com/pdf/74c24085-19b0-4534-9c90-465b8e29ad73/unit-distance-remarks.pdf). You can find an abridged version of the model’s chain of thought [here⁠](https://cdn.openai.com/pdf/1625eff6-5ac1-40d8-b1db-5d5cf925de8b/unit-distance-cot.pdf).

![]( ../../assets/2026/openai/Dark_Mode.svg|Dense black network graph with interconnected nodes forming a square pattern.)

*Previously known construction of many unit distances from a rescaled square grid.*

## The unit distance problem

Let $u(n)$ be the largest possible number of unit-distance pairs among $n$ points in the plane. Examples attaining linear growth rate are easy to construct: placing $n$ points in a line gives $n-1$ pairs, while a square grid gives about $2n$ pairs. The previously best known construction, coming from a rescaled square grid, turns out to give even more: $n^{1 + C / \log \log(n)}$ for a constant $C$. Since $\log \log(n)$ tends to infinity with $n$, the additional term in the exponent tends to $0$, meaning these constructions achieve growth only slightly faster than linear. For decades, it was widely believed that this rate was essentially the best possible, and no construction could improve significantly over the square grid. In technical terms, Erdős conjectured an upper bound of $n^{1+o(1)}$ in which the additional $o(1)$ indicates a term tending to $0$ with $n$.  
  
Our new result disproves this conjecture. More precisely, for infinitely many values of $n$, the proof constructs configurations of $n$ points with at least $n^{1+\delta}$ unit-distance pairs, for some fixed exponent $\delta > 0$. (The original AI proof does not give an explicit $\delta$, but a forthcoming refinement due to Princeton mathematics professor Will Sawin has shown one can take $\delta=0.014$.)  
  
The history of the problem helps to see why the result is surprising. The best known lower bound had been essentially unchanged since Erdős’s original 1946 construction. The best upper bound, $O(n^{4/3})$, dates to work by Spencer, Szemerédi, and Trotter in 1984, and despite later refinements and related structural work by Székely, Katz and Silier, Pach, Raz, and Solymosi and by others, the upper bound has remained essentially unchanged. As evidence in favor of the conjecture, Matoušek and Alon-Bucić-Sauermann studied the problem with non-Euclidean distances in the plane, and proved that "most" of these non-Euclidean distances obey the conjecture in some sense.  
  
Surprisingly, the key ingredients of the construction come from a very different part of mathematics known as algebraic number theory, which studies concepts like factorization in extensions of the integers known as algebraic number fields.

Erdős unit distance problem accuracy at test time

<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" width="600" height="451" viewBox="0 0 600 451" style="background-color: transparent;"><g fill="none" stroke-miterlimit="10" transform="translate(76,11)"><g role="graphics-object" aria-roledescription="group mark container"><g transform="translate(0,0)"><g><g role="graphics-symbol" aria-roledescription="axis" aria-label="X-axis titled 'log (test-time-compute)' for a log scale with values from 1 to 16"><g transform="translate(0.5,401.5)"><g><g pointer-events="none"><line transform="translate(0,0)" x2="513" y2="0" stroke="currentColor" stroke-width="1" opacity="1"></line></g><g pointer-events="none"><text text-anchor="middle" transform="translate(256.5,31)" font-family="OpenAI Sans, sans-serif" font-size="14px" font-weight="normal" fill="currentColor" opacity="1">log (test-time-compute)</text></g></g></g></g> <g role="graphics-symbol" aria-roledescription="axis" aria-label="Y-axis titled 'pass@1 accuracy' for a linear scale with values from 0 to 0.5"><g transform="translate(0.5,0.5)"><g><g pointer-events="none"><line transform="translate(0,401)" x2="-5" y2="0" stroke="currentColor" stroke-width="1" opacity="1"></line><line transform="translate(0,321)" x2="-5" y2="0" stroke="currentColor" stroke-width="1" opacity="1"></line><line transform="translate(0,241)" x2="-5" y2="0" stroke="currentColor" stroke-width="1" opacity="1"></line><line transform="translate(0,160)" x2="-5" y2="0" stroke="currentColor" stroke-width="1" opacity="1"></line><line transform="translate(0,80)" x2="-5" y2="0" stroke="currentColor" stroke-width="1" opacity="1"></line><line transform="translate(0,0)" x2="-5" y2="0" stroke="currentColor" stroke-width="1" opacity="1"></line></g><g pointer-events="none"><text text-anchor="end" transform="translate(-15,405)" font-family="SF Mono, monospace" font-size="12px" font-weight="normal" fill="currentColor" opacity="1">0</text> <text text-anchor="end" transform="translate(-15,324.8)" font-family="SF Mono, monospace" font-size="12px" font-weight="normal" fill="currentColor" opacity="1">0.1</text> <text text-anchor="end" transform="translate(-15,244.6)" font-family="SF Mono, monospace" font-size="12px" font-weight="normal" fill="currentColor" opacity="1">0.2</text> <text text-anchor="end" transform="translate(-15,164.4)" font-family="SF Mono, monospace" font-size="12px" font-weight="normal" fill="currentColor" opacity="1">0.3</text> <text text-anchor="end" transform="translate(-15,84.19999999999999)" font-family="SF Mono, monospace" font-size="12px" font-weight="normal" fill="currentColor" opacity="1">0.4</text> <text text-anchor="end" transform="translate(-15,4)" font-family="SF Mono, monospace" font-size="12px" font-weight="normal" fill="currentColor" opacity="1">0.5</text></g> <g pointer-events="none"><line transform="translate(0,401)" x2="0" y2="-401" stroke="currentColor" stroke-width="1" opacity="1"></line></g><g pointer-events="none"><text text-anchor="middle" transform="translate(-56.673828125,200.5) rotate(-90) translate(0,-3)" font-family="OpenAI Sans, sans-serif" font-size="14px" font-weight="normal" fill="currentColor" opacity="1">pass@1 accuracy</text></g></g></g></g><g role="graphics-object" aria-roledescription="group mark container"><g transform="translate(0,0)"><g><g role="graphics-object" aria-roledescription="line mark container"><path aria-label="log (test-time-compute): 1; pass@1 accuracy: 0; Technique: test-time compute; zorder: 1" role="graphics-symbol" aria-roledescription="line mark" d="M0,401L128.25,384.96L256.5,336.84L384.75,240.6L513,16.04" stroke="#dbeafe" stroke-width="1.5"></path></g><g role="graphics-object" aria-roledescription="symbol mark container"><path aria-label="log (test-time-compute): 1; pass@1 accuracy: 0; Technique: test-time compute; zorder: 1" role="graphics-symbol" aria-roledescription="point" transform="translate(0,401)" d="M3.536,0A3.536,3.536,0,1,1,-3.536,0A3.536,3.536,0,1,1,3.536,0" fill="Canvas" stroke="#dbeafe" stroke-width="1.5" opacity="1"></path><path aria-label="log (test-time-compute): 2; pass@1 accuracy: 0.02; Technique: test-time compute; zorder: 1" role="graphics-symbol" aria-roledescription="point" transform="translate(128.25,384.96)" d="M3.536,0A3.536,3.536,0,1,1,-3.536,0A3.536,3.536,0,1,1,3.536,0" fill="Canvas" stroke="#dbeafe" stroke-width="1.5" opacity="1"></path><path aria-label="log (test-time-compute): 4; pass@1 accuracy: 0.08; Technique: test-time compute; zorder: 1" role="graphics-symbol" aria-roledescription="point" transform="translate(256.5,336.84)" d="M3.536,0A3.536,3.536,0,1,1,-3.536,0A3.536,3.536,0,1,1,3.536,0" fill="Canvas" stroke="#dbeafe" stroke-width="1.5" opacity="1"></path><path aria-label="log (test-time-compute): 8; pass@1 accuracy: 0.2; Technique: test-time compute; zorder: 1" role="graphics-symbol" aria-roledescription="point" transform="translate(384.75,240.6)" d="M3.536,0A3.536,3.536,0,1,1,-3.536,0A3.536,3.536,0,1,1,3.536,0" fill="Canvas" stroke="#dbeafe" stroke-width="1.5" opacity="1"></path><path aria-label="log (test-time-compute): 16; pass@1 accuracy: 0.48; Technique: test-time compute; zorder: 1" role="graphics-symbol" aria-roledescription="point" transform="translate(513,16.040000000000013)" d="M3.536,0A3.536,3.536,0,1,1,-3.536,0A3.536,3.536,0,1,1,3.536,0" fill="Canvas" stroke="#dbeafe" stroke-width="1.5" opacity="1"></path></g></g></g></g></g></g></g></g></svg>

*After verifying the initial proof, we investigated the success rate of our models on this problem with varying amounts of test-time compute. The results are shown here.*

## New techniques from algebraic number theory

At a high level, the proof begins with a familiar geometric idea and pushes it in an unexpected direction.

Erdős’s original lower bound can be understood through the Gaussian integers: numbers of the form $a+bi$, where $a$ and $b$ are integers and $i$ is the square root of $-1$. The Gaussian integers extend the ordinary integers and, like them, enjoy properties such a unique factorization into primes. Such extensions of the ordinary integers or rationals are known as algebraic number fields. The new argument replaces the Gaussian integers by more complicated generalizations from algebraic number theory with richer symmetries that can create many more unit-length differences.

The precise argument uses tools such as infinite class field towers and Golod–Shafarevich theory to show the number fields required for the argument actually exist. These ideas were well-known to algebraic number theorists, but it came as a great surprise that these concepts have implications for geometric questions in the Euclidean plane.

## What this means for mathematics

This result marks an important moment in the interaction between AI and mathematics: an AI system has autonomously resolved a longstanding open problem at the center of an active field. It also offers an early glimpse of a new kind of collaboration between AI and human mathematicians. In this case, the companion work by external mathematicians paints a substantially richer picture than the original solution alone.

As Thomas Bloom writes in the companion note:

“ *When assessing the importance and influence of an AI-generated proof, a question I ask myself is: has this taught us something new about the problem? Do we understand discrete geometry better now? I think the answer is a moderated yes: this shows that there is a lot more that number theoretic constructions have to say about these sorts of questions than we suspected; moreover, that the number theory required can be very deep. No doubt many algebraic number theorists will be taking a close look at other open problems in discrete geometry in the coming months.*”

The unexpected connection between algebraic number theory and discrete geometry revealed by the solution is part of what makes the result notable. It does not simply settle a specific conjecture, but may provide mathematicians with a bridge to begin exploring further related problems.

Bloom also points toward a broader possibility:

“ *The frontiers of knowledge are very spiky, and no doubt the coming months and years will see similar successes in many other areas of mathematics, where long-standing open problems are resolved by an AI revealing unexpected connections and pushing the existing technical machinery to its limit. AI is helping us to more fully explore the cathedral of mathematics we have build over the centuries; what other unseen wonders are waiting in the wings?*”

This result provides a promising example: AI contributing not only a solution, but a mathematical discovery whose significance becomes clearer and richer through subsequent human understanding.

## Why this matters

The takeaway is bigger than this particular result. Better mathematical reasoning can make AI a stronger research partner: something that can hold together difficult lines of thought, connect ideas across distant areas of knowledge, surface promising paths experts may not have prioritized, and help researchers make progress on problems that would otherwise be too complex or time-intensive to tackle.

Those capabilities matter beyond mathematics. If a model can keep a complicated argument coherent, connect ideas across distant areas of knowledge, and produce work that survives expert scrutiny, those are also useful abilities in biology, physics, materials science, engineering, and medicine, and they are part of our longer-term path toward more automated research: systems that can help scientists and engineers explore more ideas and pursue harder technical questions.

AI is about to start taking a very serious role in the creative parts of research, and most importantly AI research itself. While this progress is not unexpected, it reinforces the urgency we feel about understanding this next phase of AI development, the challenges of aligning very intelligent systems, and the future of human-AI collaboration.

That future still depends on human judgment. Expertise becomes more valuable, not less. AI can help search, suggest, and verify. People choose the problems that matter, interpret the results, and decide what questions to pursue next.
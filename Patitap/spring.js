/* from :
c_spring.js from b2renger.github.io
wich is adapted from:
// M_6_1_02.pde
// Spring.pde
// 
// Generative Gestaltung, ISBN: 978-3-87439-759-9
// First Edition, Hermann Schmidt, Mainz, 2009
// Hartmut Bohnacker, Benedikt Gross, Julia Laub, Claudius Lazzeroni
// Copyright 2009 Hartmut Bohnacker, Benedikt Gross, Julia Laub, Claudius Lazzeroni
//
// http://www.generative-gestaltung.de
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
*/

function Spring(fNode, tNode, len) {
    this.fromNode = fNode;
    this.toNode = tNode;

    this.length = len;
    this.stiffness = 0.15;
    this.damping = 0.55;

    this.noiseFx = random(500);
    this.noiseFy = random(500);
    this.step = 0.0075;

    this.c1XNoise;
    this.c1YNoise;
    this.c2XNoise;
    this.c2YNoise;

    this.posx
    this.posy

    for (i = width / 10; i < 9 * (width / 10) + 1; i++) {
        posx = i
        posy = height / 2
        ellipse(posx, posy, 5, 5)
    }
}

Spring.prototype.update = function () {
    // calculate the target position
    // target = normalize(to - from) * length + from
    var diff = p5.Vector.sub(this.toNode.location, this.fromNode.location);
    diff.normalize();
    diff.mult(this.length);
    var target = p5.Vector.add(this.fromNode.location, diff);

    var force = p5.Vector.sub(target, this.toNode.location);
    force.mult(0.5);
    force.mult(this.stiffness);
    force.mult(1 - this.damping);

    this.toNode.velocity.add(force);
    this.fromNode.velocity.add(p5.Vector.mult(force, -1));
}

Spring.prototype.di

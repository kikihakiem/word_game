require 'minitest/autorun'
require_relative 'spec_helper'
require_relative '../lib/word_game'

describe WordGame do
    let(:word_list) { %w(buku roti motor) }
    let(:attempts) { %w(buuk buku roti) }
    let(:words) { BogusWordCollection.new(word_list) }
    let(:input) { BogusInput.new(attempts) }
    let(:word_game) { WordGame.new(words, input) }

    describe '#play' do
        subject { word_game.play }

        describe 'when player get 2 correct answers & 1 wrong answer' do
            it 'returns 2' do
                subject.must_equal 2
            end
        end

        describe 'when player get wrong answers on all 3 attempts' do
            let(:attempts) { %w(foo bar baz) }

            it 'returns 0' do
                subject.must_equal 0
            end
        end

        describe 'when player get correct answers on all 3 attempts' do
            let(:attempts) { word_list.dup }

            it 'returns 3' do
                subject.must_equal 3
            end
        end
    end
end
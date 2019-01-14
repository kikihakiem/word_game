require 'minitest/autorun'
require_relative 'spec_helper'
require_relative '../lib/word_game'

describe WordGame do
    let(:level1_words) { %w(buku roti motor) }
    let(:level2_words) { %w(kualifikasi termometer transnasional) }
    let(:attempts) { %w(buuk buku roti) }
    let(:input) { BogusInput.new(attempts) }
    let(:all_words) { [BogusWordCollection.new(level1_words), BogusWordCollection.new(level2_words)] }
    let(:word_game) { WordGame.new(all_words, input) }

    describe '#play' do
        subject { word_game.play }

        describe 'when player get wrong answers on all 3 attempts' do
            let(:attempts) { %w(foo bar baz) }

            it 'returns 0' do
                subject.must_equal 0
            end
        end

        describe 'when player get 2 correct answers & 1 wrong answer' do
            it 'returns 2' do
                subject.must_equal 2
            end

            it 'does not increment level' do
                subject
                word_game.level.must_equal 0
            end
        end

        describe 'when player get correct answers on all 4 attempts' do
            let(:attempts) { [*level1_words, 'kualifikasi'] }

            it 'returns 4' do
                subject.must_equal 4
            end

            it 'increments level' do
                subject
                word_game.level.must_equal 1
            end
        end
    end
end
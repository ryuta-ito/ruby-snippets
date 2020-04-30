describe Hash do
  describe '#string_cancat_merge' do
    context 'implicit delimiter' do
      subject { hash_a.string_cancat_merge(hash_b) }

      context '1 level nested' do
        context 'different value type' do
          let(:hash_a) { { hoge: 'hoge' } }
          let(:hash_b) { { hoge: 10 } }
          it { is_expected.to eq({ hoge: 10 }) }
        end

        context 'concat string' do
          let(:hash_a) { { hoge: 'hoge' } }
          let(:hash_b) { { hoge: 'fuga' } }
          it { is_expected.to eq({ hoge: 'hoge fuga'}) }
        end

        context 'merge' do
          let(:hash_a) { { hoge: 'hoge' } }
          let(:hash_b) { { fuga: 'fuga' } }
          it { is_expected.to eq({ hoge: 'hoge', fuga: 'fuga'}) }
        end
      end

      context '2 level nested' do
        context 'different value type' do
          let(:hash_a) { { hoge: { fuga: 'hoge'} } }
          let(:hash_b) { { hoge: { fuga: 10} } }
          it { is_expected.to eq({ hoge: { fuga: 10 } }) }
        end

        context 'concat string' do
          let(:hash_a) { { hoge: { fuga: 'piyo'} } }
          let(:hash_b) { { hoge: { fuga: 'piyo'} } }
          it { is_expected.to eq({ hoge: { fuga: 'piyo piyo' } }) }
        end

        context 'merge' do
          let(:hash_a) { { hoge: { fuga: 'fuga'} } }
          let(:hash_b) { { hoge: { piyo: 'piyo'} } }
          it { is_expected.to eq({ hoge: { fuga: 'fuga', piyo: 'piyo'} }) }
        end
      end
    end

    context 'explicit delimiter' do
      subject { hash_a.string_cancat_merge(hash_b, delimiter) }
      let(:delimiter) { ',' }
      let(:hash_a) { { hoge: 'hoge' } }
      let(:hash_b) { { hoge: 'fuga' } }
      it { is_expected.to eq({ hoge: 'hoge,fuga'}) }
    end
  end
end

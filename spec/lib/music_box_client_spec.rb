require 'spec_helper'

describe MusicBox::Client do
  let(:port) { 4481 }
  let(:host) { '127.0.0.1' }
  let(:socket) { double(Socket, connect: true, puts: true) }
  let(:server_addr) { subject.send(:server_addr) }

  describe '#play' do
    let(:filename) { 'test.mp3' }
    let(:file) { double(File, read: true) }
    let(:data) { 'some data' }

    before {
      allow(Socket).to receive(:new).with(:INET, :STREAM).and_return(socket)
      allow(File).to receive(:open).with(filename).and_return(file)
      allow(file).to receive(:read).and_return(data)
    }
    after { subject.play(filename) }

    it 'connects the socket to the server address' do
      expect(socket).to receive(:connect).with(server_addr)
    end

    it 'reads the content from the provided fie' do
      expect(File).to receive(:open).with(filename).and_return(file)
      expect(file).to receive(:read)
    end

    it 'write to the connected socket' do
      expect(socket).to receive(:puts).with(data)
    end
  end
end
